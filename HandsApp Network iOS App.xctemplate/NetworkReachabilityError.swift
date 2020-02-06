import Foundation

struct NetworkReachabilityError: Error, LocalizedError {
    var errorDescription: String? {
        return localizedDescription
    }

    var localizedDescription: String {
        return String()
    }
}
