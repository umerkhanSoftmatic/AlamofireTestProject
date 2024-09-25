//import SwiftUI
//import FirebaseAuth
//
//struct PhoneAuthView: View {
//    @State private var phoneNumber: String = ""
//    @State private var verificationCode: String = ""
//    @State private var verificationID: String?
//    @State private var errorMessage: String?
//    @State private var isLoading: Bool = false
//
//    var body: some View {
//        VStack {
//            TextField("Enter your phone number", text: $phoneNumber)
//                .keyboardType(.phonePad)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Button(action: requestVerificationCode) {
//                if isLoading {
//                    ProgressView()
//                } else {
//                    Text("Send Verification Code")
//                }
//            }
//            .padding()
//            .disabled(isLoading)
//
//            
//            TextField("Enter verification code", text: $verificationCode)
//                .keyboardType(.numberPad)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Button(action: verifyCode) {
//                if isLoading {
//                    ProgressView()
//                } else {
//                    Text("Verify Code and Sign In")
//                }
//            }
//            .padding()
//            .disabled(isLoading)
//
//            // Error Message Display
//            if let errorMessage = errorMessage {
//                Text(errorMessage)
//                    .foregroundColor(.red)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//
//   
//    private func requestVerificationCode() {
//        let formattedPhoneNumber = phoneNumber.trimmingCharacters(in: .whitespaces)
//
//       
//        guard !formattedPhoneNumber.isEmpty else {
//            errorMessage = "Please enter a valid phone number."
//            return
//        }
//
//        isLoading = true
//        
//    
//        //Auth.auth().settings?.isAppVerificationDisabledForTesting = true
//        PhoneAuthProvider.provider().verifyPhoneNumber(formattedPhoneNumber, uiDelegate: nil) { verificationID, error in
//            isLoading = false
//
//            if let error = error {
//                // Log the error for debugging
//                print("Error requesting verification code: \(error.localizedDescription)")
//                self.errorMessage = "Error requesting verification code: \(error.localizedDescription)"
//                return
//            }
//
//            // Successfully received verification ID
//            print("Verification ID received: \(String(describing: verificationID))") // Debug output
//            self.verificationID = verificationID
//            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
//            self.errorMessage = nil // Clear any previous error messages
//        }
//    }
//
//
//    // Verify the Code and Sign In
//    private func verifyCode() {
//        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
//            errorMessage = "Verification ID not found."
//            return
//        }
//
//        // Validate verification code input
//        guard !verificationCode.isEmpty else {
//            errorMessage = "Please enter the verification code."
//            return
//        }
//
//        isLoading = true
//        let credential = PhoneAuthProvider.provider().credential(
//            withVerificationID: verificationID,
//            verificationCode: verificationCode
//        )
//
//        Auth.auth().signIn(with: credential) { authResult, error in
//            isLoading = false
//
//            if let error = error {
//                self.errorMessage = "Error signing in: \(error.localizedDescription)"
//                print("Error signing in: \(error.localizedDescription)") // Debug output
//                return
//            }
//            
//            print("User signed in successfully!")
//            // Proceed to the next screen or perform further actions here
//        }
//    }
//
//}
//
//struct PhoneAuthView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhoneAuthView()
//    }
//}
