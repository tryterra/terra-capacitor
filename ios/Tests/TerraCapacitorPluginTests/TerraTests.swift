import TerraiOS
import XCTest

@testable import TerraCapacitorPlugin

class TerraTests: XCTestCase {
    func testEcho() {
        let implementation = TerraCapacitor()
        let value = "Hello, World!"

        XCTAssertEqual(value, implementation.echo(value))
    }

    func testConnectionMapsSupportedNamesOnly() {
        XCTAssertEqual(TerraMappings.connection("APPLE_HEALTH"), .APPLE_HEALTH)
        XCTAssertEqual(TerraMappings.connection("FREESTYLE_LIBRE"), .FREESTYLE_LIBRE)
        XCTAssertNil(TerraMappings.connection("GOOGLE"))
        XCTAssertNil(TerraMappings.connection(nil))
    }

    func testCustomPermissionsSkipUnknownNames() {
        let permissions = TerraMappings.customPermissions(["STEPS", "WORKOUT_TYPES", "NOT_A_PERMISSION"])

        XCTAssertEqual(permissions, [.STEPS, .WORKOUT_TYPE])
    }

    func testErrorMessages() {
        XCTAssertEqual(TerraMappings.message(for: .InvalidDevID), "Invalid Dev ID")
        XCTAssertEqual(TerraMappings.message(for: .NoInternet), "No Internet")
    }
}
