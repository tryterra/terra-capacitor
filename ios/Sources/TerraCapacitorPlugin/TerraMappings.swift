import Foundation
import TerraiOS

enum TerraMappings {
    static func connection(_ name: String?) -> Connections? {
        switch name {
        case "APPLE_HEALTH":
            return .APPLE_HEALTH
        case "FREESTYLE_LIBRE":
            return .FREESTYLE_LIBRE
        default:
            print("Passed invalid connection")
            return nil
        }
    }

    static let customPermissionsByName: [String: CustomPermissions] = [
        "WORKOUT_TYPES": .WORKOUT_TYPE,
        "ACTIVITY_SUMMARY": .ACTIVITY_SUMMARY,
        "LOCATION": .LOCATION,
        "CALORIES": .CALORIES,
        "STEPS": .STEPS,
        "HEART_RATE": .HEART_RATE,
        "HEART_RATE_VARIABILITY": .HEART_RATE_VARIABILITY,
        "VO2MAX": .VO2MAX,
        "HEIGHT": .HEIGHT,
        "ACTIVE_DURATIONS": .ACTIVE_DURATIONS,
        "WEIGHT": .WEIGHT,
        "FLIGHTS_CLIMBED": .FLIGHTS_CLIMBED,
        "BMI": .BMI,
        "BODY_FAT": .BODY_FAT,
        "EXERCISE_DISTANCE": .EXERCISE_DISTANCE,
        "GENDER": .GENDER,
        "DATE_OF_BIRTH": .DATE_OF_BIRTH,
        "BASAL_ENERGY_BURNED": .BASAL_ENERGY_BURNED,
        "SWIMMING_SUMMARY": .SWIMMING_SUMMARY,
        "RESTING_HEART_RATE": .RESTING_HEART_RATE,
        "BLOOD_PRESSURE": .BLOOD_PRESSURE,
        "BLOOD_GLUCOSE": .BLOOD_GLUCOSE,
        "BODY_TEMPERATURE": .BODY_TEMPERATURE,
        "MINDFULNESS": .MINDFULNESS,
        "LEAN_BODY_MASS": .LEAN_BODY_MASS,
        "OXYGEN_SATURATION": .OXYGEN_SATURATION,
        "SLEEP_ANALYSIS": .SLEEP_ANALYSIS,
        "RESPIRATORY_RATE": .RESPIRATORY_RATE,
        "NUTRITION_SODIUM": .NUTRITION_SODIUM,
        "NUTRITION_PROTEIN": .NUTRITION_PROTEIN,
        "NUTRITION_CARBOHYDRATES": .NUTRITION_CARBOHYDRATES,
        "NUTRITION_FIBRE": .NUTRITION_FIBRE,
        "NUTRITION_FAT_TOTAL": .NUTRITION_FAT_TOTAL,
        "NUTRITION_SUGAR": .NUTRITION_SUGAR,
        "NUTRITION_VITAMIN_C": .NUTRITION_VITAMIN_C,
        "NUTRITION_VITAMIN_A": .NUTRITION_VITAMIN_A,
        "NUTRITION_CALORIES": .NUTRITION_CALORIES,
        "NUTRITION_WATER": .NUTRITION_WATER,
        "NUTRITION_CHOLESTEROL": .NUTRITION_CHOLESTEROL
    ]

    static func customPermissions(_ names: [String]) -> Set<CustomPermissions> {
        Set(names.compactMap { customPermissionsByName[$0] })
    }

    // swiftlint:disable:next cyclomatic_complexity
    static func message(for error: TerraError) -> String {
        switch error {
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
        default: return "Unknown Error Type. Please contact dev@tryterra.co"
        }
    }
}
