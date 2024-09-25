//import FirebaseAuth
//import FirebaseCore
//import GoogleSignIn
//import UIKit
//
//class GoogleSignInViewModel: ObservableObject {
//    @Published var isAuthenticated = false
//    @Published var errorMessage: String?
//
//    func signInWithGoogle() {
//        guard let clientID = FirebaseApp.app()?.options.clientID else {
//            self.errorMessage = "Client ID not found"
//            return
//        }
//
//        // Initialize the GIDConfiguration
//        _ = GIDConfiguration(clientID: clientID)
//
//        // Get the current active window scene and its root view controller
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//              let rootViewController = windowScene.windows.first?.rootViewController else {
//            self.errorMessage = "No root view controller!"
//            return
//        }
//
//        // Google Sign-In
//        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
//            if let error = error {
//                self.errorMessage = "Google Sign-In error: \(error.localizedDescription)"
//                return
//            }
//
//            guard let user = result?.user,
//                  let idToken = user.idToken?.tokenString else {
//                self.errorMessage = "Missing ID token!"
//                return
//            }
//
//            // Create a Firebase credential using the Google ID token
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
//
//            // Sign in to Firebase with Google credential
//            Auth.auth().signIn(with: credential) { authResult, error in
//                if let error = error {
//                    self.errorMessage = "Firebase Authentication error: \(error.localizedDescription)"
//                    return
//                }
//
//                // Successfully authenticated with Google
//                self.isAuthenticated = true
//            }
//        }
//    }
//}
