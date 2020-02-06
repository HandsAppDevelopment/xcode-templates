import KeychainSwift

class Keychain: KeychainSwift {
    override init() {
        let prefix = Bundle.main.bundleIdentifier ?? "ru.handsapp" + "_keychain_"
        super.init(keyPrefix: prefix)
    }
}
