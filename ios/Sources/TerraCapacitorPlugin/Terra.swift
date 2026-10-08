import Foundation

@objc public class TerraCapacitor: NSObject {
    @objc public func echo(_ value: String) -> String {
        print("Called inside iOS: \(value)")
        return value
    }
}
