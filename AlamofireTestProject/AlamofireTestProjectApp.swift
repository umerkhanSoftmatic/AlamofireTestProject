//import SwiftUI
//import FirebaseCore
//import FirebaseAuth
//import UserNotifications
//
//class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
//    
//    var window: UIWindow?
//    
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
//        // Configure Firebase
//        FirebaseApp.configure()
//        
//        // Set UNUserNotificationCenter delegate
//        UNUserNotificationCenter.current().delegate = self
//        
//        // Request notification permissions
//        requestNotificationPermissions()
//        
//        // Register for remote notifications
//        application.registerForRemoteNotifications()
//        
//        return true
//    }
//    
//    // Request user's permission for notifications
//    private func requestNotificationPermissions() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if granted {
//                print("Permission granted for notifications.")
//                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
//            } else {
//                print("User denied notification permissions: \(String(describing: error?.localizedDescription))")
//            }
//        }
//    }
//
//    // Handle device token registration
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//      // Pass device token to auth
//      Auth.auth().setAPNSToken(deviceToken, type: .unknown)
//
//      // Further handling of the device token if needed by the app
//      // ...
//    }
//
//    func application(_ application: UIApplication,
//        didReceiveRemoteNotification notification: [AnyHashable : Any],
//        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//      if Auth.auth().canHandleNotification(notification) {
//        completionHandler(.noData)
//        return
//      }
//      // This notification is not auth related; it should be handled separately.
//    }
//    
//}
//
//@main
//struct AlamofireTestProjectApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    
//    var body: some Scene {
//        WindowGroup {
//            ContentView().onOpenURL { url in
//                Auth.auth().canHandle(url.absoluteURL)
//            }
//        }
//        
//    }
//}


import SwiftUI
import FirebaseCore
import GoogleSignIn
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
    
    @available(iOS 9.0, *)
        func application(_ application: UIApplication, open url: URL,
                         options: [UIApplication.OpenURLOptionsKey: Any])
          -> Bool {
          return GIDSignIn.sharedInstance.handle(url)
        }
    
}

extension View {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        

        return root
    }
}

@main
struct AlamofireTestProjectApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
                ContentView()
        }
    }
}
