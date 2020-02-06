import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterDistribute
import HandsAppUI
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, HandsAppDelegate {
    var window: UIWindow?

    var theme: Theme.Type {
        return DefaultTheme.self
    }

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startAppCenter()
        setupWindow()
        return true
    }

    private func startAppCenter() {
        let services: [AnyClass] = [MSAnalytics.self, MSDistribute.self, MSCrashes.self]
        MSAppCenter.start(ApiKeys.appCenter, withServices: services)
    }

    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }
}
