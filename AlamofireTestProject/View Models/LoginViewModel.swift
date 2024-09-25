import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var userEmail: String?
    
    func login(completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
                completion(false)
                return
            }

           
            if let user = result?.user, !user.isEmailVerified {
                self.alertMessage = "Please verify your email before logging in."
                self.showAlert = true
                completion(false)
                return
            }

            completion(true)
        }
    }
    
    
    
    func fetchCurrentUserEmail() {
           if let user = Auth.auth().currentUser {
               userEmail = user.displayName
           } else {
               userEmail = nil
           }
       }
}
