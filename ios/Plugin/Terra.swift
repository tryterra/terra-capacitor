import Foundation

@objc public class Terra: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
