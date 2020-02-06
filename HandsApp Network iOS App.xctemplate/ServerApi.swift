import Moya

enum ServerApi {
    #warning("This is sample implementation of api endpoint. Remove it if needed")
    case auth(firToken: String)
}

// MARK: - Moya setup

extension ServerApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: AppDefaults.serverApiBaseUrl) else {
            fatalError("Failed to provide server api base url")
        }
        return url
    }

    var path: String {
        switch self {
        case .auth:
            return "auth/firebase"
        }
    }

    var method: Method {
        switch self {
        case .auth:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var task: Task {
        switch self {
        case let .auth(firToken):
            let parameters = ["access_token": firToken]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
