import Moya

// MARK: - AuthPlugin

class AuthPlugin: PluginType {
    private let keychain = Keychain()

    func prepare(_ request: URLRequest, target _: TargetType) -> URLRequest {
        let jwtToken: String = keychain.get(KeychainKeys.jwtToken) ?? ""
        var request = request
        request.addValue(
            "JWT \(jwtToken)",
            forHTTPHeaderField: "Authorization"
        )
        return request
    }
}
