import Foundation

struct HTTPNetworkError: Error {
    let statusCode: Int
}

extension HTTPNetworkError: LocalizedError {
    var errorDescription: String? {
        return localizedDescription
    }

    var localizedDescription: String {
        switch statusCode {
        case 401:
            return R.string.localizable.network_error_no_registration()
        case 403:
            return R.string.localizable.network_error_forbidden()
        case 404:
            return R.string.localizable.network_error_not_found()
        case 500, 502:
            return R.string.localizable.network_error_internal_server_error()
        default:
            return R.string.localizable.network_error_default()
        }
    }
}
