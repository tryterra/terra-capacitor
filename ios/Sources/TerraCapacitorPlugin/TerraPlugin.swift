import Foundation
import Capacitor
import TerraiOS
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(TerraPlugin)
public class TerraPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "TerraPlugin"
    public let jsName = "TerraCapacitor"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "initTerra", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "initConnection", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getUserId", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getBody", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getActivity", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getDaily", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getNutrition", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getSleep", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getMenstruation", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getAthlete", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "activateSensor", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "readGlucoseData", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = TerraCapacitor()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    //  require init on main
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }

    // terra instance managed
    private var terra: TerraManager?

    // initialize
    @objc
    func initTerra(_ call: CAPPluginCall) {
        Terra.instance(
            devId: call.getString("devId") ?? "",
            referenceId: call.getString("referenceId") ?? nil
        ) { instance, error in
            if let error = error {
                call.resolve(["success": false, "error": TerraMappings.message(for: error)])
            } else {
                self.terra = instance
                call.resolve(["success": true])
            }
        }
    }

    @objc
    func initConnection(_ call: CAPPluginCall) {
        guard let token = call.getString("token") else {
            call.resolve(["success": false, "error": "Invalid Token"])
            return
        }
        let schedulerOn = call.getBool("schedulerOn") ?? false
        let customPermissions = call.getArray("customPermissions") as? [String] ?? []

        guard let connection = TerraMappings.connection(call.getString("connection")) else {
            call.resolve(["success": false, "error": "Invalid Connection Type"])
            return
        }
        terra?.initConnection(
            type: connection,
            token: token,
            customReadTypes: TerraMappings.customPermissions(customPermissions),
            schedulerOn: schedulerOn
        ) { success, error in
            if let error = error {
                call.resolve(["success": success, "error": TerraMappings.message(for: error)])
            } else {
                call.resolve(["success": success])
            }
        }
    }

    @objc
    func getUserId(_ call: CAPPluginCall) {
        if let connection = TerraMappings.connection(call.getString("connection")) {
            call.resolve(["success": true, "userId": terra?.getUserId(type: connection) as Any])
        } else {
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }

    // getters
    @objc
    func getBody(_ call: CAPPluginCall) {
        fetch(call) { terra, connection, startDate, endDate, toWebhook, completion in
            terra.getBody(
                type: connection, startDate: startDate, endDate: endDate, toWebhook: toWebhook, completion: completion
            )
        }
    }

    @objc
    func getActivity(_ call: CAPPluginCall) {
        fetch(call) { terra, connection, startDate, endDate, toWebhook, completion in
            terra.getActivity(
                type: connection, startDate: startDate, endDate: endDate, toWebhook: toWebhook, completion: completion
            )
        }
    }

    @objc
    func getNutrition(_ call: CAPPluginCall) {
        fetch(call) { terra, connection, startDate, endDate, toWebhook, completion in
            terra.getNutrition(
                type: connection, startDate: startDate, endDate: endDate, toWebhook: toWebhook, completion: completion
            )
        }
    }

    @objc
    func getMenstruation(_ call: CAPPluginCall) {
        fetch(call) { terra, connection, startDate, endDate, toWebhook, completion in
            terra.getMenstruation(
                type: connection, startDate: startDate, endDate: endDate, toWebhook: toWebhook, completion: completion
            )
        }
    }

    @objc
    func getDaily(_ call: CAPPluginCall) {
        fetch(call) { terra, connection, startDate, endDate, toWebhook, completion in
            terra.getDaily(
                type: connection, startDate: startDate, endDate: endDate, toWebhook: toWebhook, completion: completion
            )
        }
    }

    @objc
    func getSleep(_ call: CAPPluginCall) {
        fetch(call) { terra, connection, startDate, endDate, toWebhook, completion in
            terra.getSleep(
                type: connection, startDate: startDate, endDate: endDate, toWebhook: toWebhook, completion: completion
            )
        }
    }

    @objc
    func getAthlete(_ call: CAPPluginCall) {
        let toWebhook = call.getBool("toWebhook") ?? true
        guard let connection = TerraMappings.connection(call.getString("connection")) else {
            call.resolve(["success": false, "error": "Invalid Connection Type"])
            return
        }
        terra?.getAthlete(type: connection, toWebhook: toWebhook) { success, data, error in
            self.resolveData(call, success: success, data: data, error: error)
        }
    }

    // Freestyle glucose init
    @objc
    func readGlucoseData(_ call: CAPPluginCall) {
        terra?.readGlucoseData { details in
            self.resolveSensor(call, details: details)
        }
    }

    @objc
    func activateSensor(_ call: CAPPluginCall) {
        terra?.activateSensor { details in
            self.resolveSensor(call, details: details)
        }
    }

    private typealias DataCompletion<T> = (Bool, T?, TerraError?) -> Void

    /// Shared argument handling for the date-ranged getters. An omitted `endDate` means now, which is also the
    /// TerraiOS default.
    private func fetch<T: Encodable>(
        _ call: CAPPluginCall,
        request: @escaping (TerraManager, Connections, Date, Date, Bool, @escaping DataCompletion<T>) -> Void
    ) {
        guard let startDate = call.getDate("startDate") else {
            call.resolve(["success": false, "error": "Require startDate parameter"])
            return
        }
        let endDate = call.getDate("endDate") ?? Date()
        let toWebhook = call.getBool("toWebhook") ?? true
        guard let connection = TerraMappings.connection(call.getString("connection")) else {
            call.resolve(["success": false, "error": "Invalid Connection Type"])
            return
        }
        guard let terra = terra else {
            return
        }
        request(terra, connection, startDate, endDate, toWebhook) { success, data, error in
            self.resolveData(call, success: success, data: data, error: error)
        }
    }

    private func resolveData<T: Encodable>(_ call: CAPPluginCall, success: Bool, data: T?, error: TerraError?) {
        if let error = error {
            call.resolve(["success": false, "data": NSNull(), "error": TerraMappings.message(for: error)])
            return
        }
        do {
            let jsonData = try JSONEncoder().encode(data)
            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
        } catch {
            call.resolve(["success": success, "error": "Error decoding data into correct format"])
        }
    }

    private func resolveSensor(_ call: CAPPluginCall, details: FSLSensorDetails?) {
        do {
            let jsonData = try JSONEncoder().encode(details)
            call.resolve(["success": true, "data": String(data: jsonData, encoding: .utf8) ?? ""])
        } catch {
            print(error) // Should never execute
        }
    }
}
