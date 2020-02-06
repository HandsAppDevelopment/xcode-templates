import Moya
import Result

class ErrorHandlingPlugin: PluginType {
    private let reachabilityManager = ReachabilityManager(host: AppDefaults.serverApiBaseUrl)
    weak var errorHandler: ErrorHandler?

    func didReceive(_ result: Result<Response, MoyaError>, target _: TargetType) {
        guard case let .failure(moyaError) = result,
            let errorHandler = errorHandler else { return }

        if case let .underlying(error, _) = moyaError,
            (error as NSError).code == NSURLErrorCancelled {
            return
        }

        var error: Error = moyaError
        if let reachabilityManager = reachabilityManager,
            !reachabilityManager.isReachable {
            error = NetworkReachabilityError()
        } else if let statusCode = moyaError.response?.statusCode {
            error = HTTPNetworkError(statusCode: statusCode)
        }
        errorHandler.handle(error: error)
    }
}
