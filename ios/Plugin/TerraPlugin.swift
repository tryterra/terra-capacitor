import Foundation
import Capacitor
import TerraiOS
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(TerraPlugin)
public class TerraPlugin: CAPPlugin {
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

     private func errorMessage(_ err: TerraError) -> String{
        switch(err){
            case .HealthKitUnavailable: return "Health Kit Unavailable"
            case .ServiceUnavailable: return "Service Unavailable"
            case .Unauthenticated: return "Unauthenticated"
            case .InvalidUserID: return "Invalid User ID"
            case .InvalidDevID: return "Invalid Dev ID"
            case .Forbidden: return "Forbidden"
            case .BadRequest: return "Bad Request"
            case .UnknownOpcode: return "Unknown Op Code"
            case .UnexpectedError: return "Unexpected Error"
            case .NFCError: return "NFC Error"
            case .SensorExpired: return "Sensor Expired"
            case .SensorReadingFailed: return "Sensor Reading Failed"
            case .NoInternet: return "No Internet"
            case .UserLimitsReached: return "User Limit Reached"
            case .IncorrectDevId: return "Incorrect Dev ID"
            case .InvalidToken: return "Invalid Token"
            case .HealthKitAuthorizationError: return "Health Kit Authorization Error"
            case .UnsupportedResource: return "Unsupported Resource"
            default: "Unknown Error Type. Please contact dev@tryterra.co"
        }
        return ""
    } 

    // terra instance managed
    private var terra: TerraManager?
    
    // connection type translate
    private func connectionParse(connection: String) -> Connections? {
        switch connection {
            case "APPLE_HEALTH":
                return Connections.APPLE_HEALTH
            case "FREESTYLE_LIBRE":
                return Connections.FREESTYLE_LIBRE
            default:
                print("Passed invalid connection")
        }
      return nil
    }

    private func customPermissionParse(cPermission: String) -> CustomPermissions? {
        switch cPermission {
            case "WORKOUT_TYPES":
                return CustomPermissions.WORKOUT_TYPE;
            case "ACTIVITY_SUMMARY":
                return CustomPermissions.ACTIVITY_SUMMARY;
            case "LOCATION":
                return CustomPermissions.LOCATION;
            case "CALORIES":
                return CustomPermissions.CALORIES;
            case "STEPS":
                return CustomPermissions.STEPS;
            case "HEART_RATE":
                return CustomPermissions.HEART_RATE;
            case "HEART_RATE_VARIABILITY":
                return CustomPermissions.HEART_RATE_VARIABILITY;
            case "VO2MAX":
                return CustomPermissions.VO2MAX;
            case "HEIGHT":
                return CustomPermissions.HEIGHT;
            case "ACTIVE_DURATIONS":
                return CustomPermissions.ACTIVE_DURATIONS;
            case "WEIGHT":
                return CustomPermissions.WEIGHT;
            case "FLIGHTS_CLIMBED":
                return CustomPermissions.FLIGHTS_CLIMBED;
            case "BMI":
                return CustomPermissions.BMI;
            case "BODY_FAT":
                return CustomPermissions.BODY_FAT;
            case "EXERCISE_DISTANCE":
                return CustomPermissions.EXERCISE_DISTANCE;
            case "GENDER":
                return CustomPermissions.GENDER;
            case "DATE_OF_BIRTH":
                return CustomPermissions.DATE_OF_BIRTH;
            case "BASAL_ENERGY_BURNED":
                return CustomPermissions.BASAL_ENERGY_BURNED;
            case "SWIMMING_SUMMARY":
                return CustomPermissions.SWIMMING_SUMMARY;
            case "RESTING_HEART_RATE":
                return CustomPermissions.RESTING_HEART_RATE;
            case "BLOOD_PRESSURE":
                return CustomPermissions.BLOOD_PRESSURE;
            case "BLOOD_GLUCOSE":
                return CustomPermissions.BLOOD_GLUCOSE;
            case "BODY_TEMPERATURE":
                return CustomPermissions.BODY_TEMPERATURE;
            case "MINDFULNESS":
                return CustomPermissions.MINDFULNESS;
            case "LEAN_BODY_MASS":
                return CustomPermissions.LEAN_BODY_MASS;
            case "OXYGEN_SATURATION":
                return CustomPermissions.OXYGEN_SATURATION;
            case "SLEEP_ANALYSIS":
                return CustomPermissions.SLEEP_ANALYSIS;
            case "RESPIRATORY_RATE":
                return CustomPermissions.RESPIRATORY_RATE;
            case "NUTRITION_SODIUM":
                return CustomPermissions.NUTRITION_SODIUM;
            case "NUTRITION_PROTEIN":
                return CustomPermissions.NUTRITION_PROTEIN;
            case "NUTRITION_CARBOHYDRATES":
                return CustomPermissions.NUTRITION_CARBOHYDRATES;
            case "NUTRITION_FIBRE":
                return CustomPermissions.NUTRITION_FIBRE;
            case "NUTRITION_FAT_TOTAL":
                return CustomPermissions.NUTRITION_FAT_TOTAL;
            case "NUTRITION_SUGAR":
                return CustomPermissions.NUTRITION_SUGAR;
            case "NUTRITION_VITAMIN_C":
                return CustomPermissions.NUTRITION_VITAMIN_C;
            case "NUTRITION_VITAMIN_A":
                return CustomPermissions.NUTRITION_VITAMIN_A;
            case "NUTRITION_CALORIES":
                return CustomPermissions.NUTRITION_CALORIES;
            case "NUTRITION_WATER":
                return CustomPermissions.NUTRITION_WATER;
            case "NUTRITION_CHOLESTEROL":
                return CustomPermissions.NUTRITION_CHOLESTEROL;
            default:
                return nil
        }
    }
    
    private func customPermissionsSet(customPermissions: [String]) -> Set<CustomPermissions> {
        var out: Set<CustomPermissions> = Set([])

        for permission in customPermissions {
            out.insert(customPermissionParse(cPermission: permission)!)
        }

        return out
    }

    // initialize
    @objc
    func initTerra(_ call: CAPPluginCall){
        Terra.instance(
            devId: call.getString("devId") ?? "",
            referenceId: call.getString("referenceId") ?? nil
        ){instance, error in
            if let error = error{
                call.resolve(["success": false, "error": self.errorMessage(error)])
            }
            else{
                self.terra = instance
                call.resolve(["success": true])
            }
        }
    }
    
    @objc
    func initConnection(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        guard let token = call.getString("token") else {
            call.resolve(["success": false, "error": "Invalid Token"])
            return
        }
        let schedulerOn = call.getBool("schedulerOn") ?? false
        let customPermissions = (call.getArray("customPermissions") ?? []) as! [String]

        if let connection = connectionParse(connection: connection){
            terra?.initConnection(type: connection, token: token, customReadTypes: customPermissionsSet(customPermissions: customPermissions), schedulerOn: schedulerOn, completion: {success, error in
                    if let error = error{
                        call.resolve(["success": success, "error": self.errorMessage(error)])
                    }
                    else{
                        call.resolve(["success": success])
                    }
                }
            )
        }
        else {
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }

    @objc
    func getUserId(_ call: CAPPluginCall){
        if let connection = connectionParse(connection: call.getString("connection") ?? ""){
            call.resolve(["success": true, "userId": terra?.getUserId(type: connection)])
        }
        else{
            call.resolve(["success": false, "error": "Invalid COnnection Type"])
        }
    }
    
    // getters
    @objc
    func getBody(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        guard let startDate = call.getDate("startDate") else {
            call.resolve(["success": false, "error": "Require startDate parameter"])
            return
        }
        let endDate = call.getDate("endDate") ?? nil
        let toWebhook = call.getBool("toWebhook") ?? true
        if let connection = connectionParse(connection: connection){
            if endDate != nil {
                terra?.getBody(type: connection, startDate: startDate, endDate: endDate!, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            } else {
                terra?.getBody(type: connection, startDate: startDate, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            }
        }
        else{
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }
    @objc
    func getActivity(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        guard let startDate = call.getDate("startDate") else {
            call.resolve(["success": false, "error": "Require startDate parameter"])
            return
        }
        let endDate = call.getDate("endDate") ?? nil
        let toWebhook = call.getBool("toWebhook") ?? true
        if let connection = connectionParse(connection: connection){
            if endDate != nil {
                terra?.getActivity(type: connection, startDate: startDate, endDate: endDate!, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            } else {
                terra?.getActivity(type: connection, startDate: startDate, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            }
        }
        else{
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }

    @objc
    func getNutrition(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        guard let startDate = call.getDate("startDate") else {
            call.resolve(["success": false, "error": "Require startDate parameter"])
            return
        }
        let endDate = call.getDate("endDate") ?? nil
        let toWebhook = call.getBool("toWebhook") ?? true
        if let connection = connectionParse(connection: connection){
            if endDate != nil {
                terra?.getNutrition(type: connection, startDate: startDate, endDate: endDate!, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            } else {
                terra?.getNutrition(type: connection, startDate: startDate, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            }
        }
        else{
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }

    @objc
    func getMenstruation(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        guard let startDate = call.getDate("startDate") else {
            call.resolve(["success": false, "error": "Require startDate parameter"])
            return
        }
        let endDate = call.getDate("endDate") ?? nil
        let toWebhook = call.getBool("toWebhook") ?? true
        if let connection = connectionParse(connection: connection){
            if endDate != nil {
                terra?.getMenstruation(type: connection, startDate: startDate, endDate: endDate!, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            } else {
                terra?.getMenstruation(type: connection, startDate: startDate, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            }
        }
        else{
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }

    @objc
    func getAthlete(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        let toWebhook = call.getBool("toWebhook") ?? true
        if let connection = connectionParse(connection: connection){
            terra?.getAthlete(type: connection, toWebhook: toWebhook){
                (success, data, err) in 
                if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                }
                else{
                    do {
                        let jsonData = try JSONEncoder().encode(data)
                        call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                    }
                    catch {
                        call.resolve(["success": success, "error": "Error decoding data into correct format"])
                    }
                }
            }        
        }
        else{
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }
    @objc
    func getDaily(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        guard let startDate = call.getDate("startDate") else {
            call.resolve(["success": false, "error": "Require startDate parameter"])
            return
        }
        let endDate = call.getDate("endDate") ?? nil
        let toWebhook = call.getBool("toWebhook") ?? true
        if let connection = connectionParse(connection: connection){
            if endDate != nil {
                terra?.getDaily(type: connection, startDate: startDate, endDate: endDate!, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            } else {
                terra?.getDaily(type: connection, startDate: startDate, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            }
        }
        else{
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }

    @objc
    func getSleep(_ call: CAPPluginCall){
        let connection = call.getString("connection") ?? ""
        guard let startDate = call.getDate("startDate") else {
            call.resolve(["success": false, "error": "Require startDate parameter"])
            return
        }
        let endDate = call.getDate("endDate") ?? nil
        let toWebhook = call.getBool("toWebhook") ?? true
        if let connection = connectionParse(connection: connection){
            if endDate != nil {
                terra?.getSleep(type: connection, startDate: startDate, endDate: endDate!, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            } else {
                terra?.getSleep(type: connection, startDate: startDate, toWebhook: toWebhook){
                    (success, data, err) in 
                    if let err = err {
                        call.resolve(["success": false, "data": nil, "error": self.errorMessage(err)])
                    }
                    else{
                        do {
                            let jsonData = try JSONEncoder().encode(data)
                            call.resolve(["success": success, "data": String(data: jsonData, encoding: .utf8) ?? ""])
                        }
                        catch {
                            call.resolve(["success": success, "error": "Error decoding data into correct format"])
                        }
                    }
                }            
            }
        }
        else{
            call.resolve(["success": false, "error": "Invalid Connection Type"])
        }
    }
    
    // Freestyle glucose init
    @objc
    func readGlucoseData(_ call: CAPPluginCall){
        terra?.readGlucoseData{(details) in
            do {
                let jsonData = try JSONEncoder().encode(details)
                call.resolve(["success": true, "data": String(data: jsonData, encoding: .utf8) ?? ""])
            }
            catch {
                print(error) //Should never execute
            }
        }
    }

    @objc
    func activateSensor(_ call: CAPPluginCall){
        terra?.activateSensor{(details) in
            do {
                let jsonData = try JSONEncoder().encode(details)
                call.resolve(["success": true, "data": String(data: jsonData, encoding: .utf8) ?? ""])
            }
            catch {
                print(error) //Should never execute
            }
        }
    }
}
