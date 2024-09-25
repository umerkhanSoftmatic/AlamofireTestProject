import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""

    func signUp(completion: @escaping (Bool) -> Void) {
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty || name.isEmpty {
            alertMessage = "Please fill in all fields."
            showAlert = true
            completion(false)
            return
        }

        if password != confirmPassword {
            alertMessage = "Passwords do not match."
            showAlert = true
            completion(false)
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
                completion(false)
                return
            }

            // Set display name
            let changeRequest = result?.user.createProfileChangeRequest()
            changeRequest?.displayName = self.name // Set the display name
            changeRequest?.commitChanges { error in
                if let error = error {
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                    completion(false)
                    return
                }

                
                result?.user.sendEmailVerification(completion: { error in
                    if let error = error {
                        self.alertMessage = error.localizedDescription
                        self.showAlert = true
                        completion(false)
                        return
                    }

                    self.alertMessage = "Verification email sent. Please check your inbox."
                    self.showAlert = true
                    completion(true)
                })
            }
        }
    }
}
