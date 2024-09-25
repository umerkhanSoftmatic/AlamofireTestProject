//import SwiftUI
//import FirebaseAuth
//
//class PhoneAuthViewModel: ObservableObject {
//    @Published var phoneNumber: String = ""
//    @Published var verificationID: String = ""
//    @Published var code: String = ""
//    @Published var showAlert: Bool = false
//    @Published var alertMessage: String = ""
//
//    func sendVerificationCode(completion: @escaping (Bool) -> Void) {
//        let verificationGenerator = PhoneAuthProvider.provider()
//        verificationGenerator.verifyPhoneNumber(PhoneAuthProvider.phoneNumber(with: phoneNumber), completion: { verificationID, error in
//            if let error = error {
//                self.alertMessage = error.localizedDescription
//                self.showAlert = true
//                completion(false)
//                return
//            }
//            self.verificationID = verificationID ?? ""
//            completion(true)
//        })
//    }
//
//    func verifyCode(completion: @escaping (Bool) -> Void) {
//        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
//
//        Auth.auth().signIn(with: credential) { result, error in
//            if let error = error {
//                self.alertMessage = error.localizedDescription
//                self.showAlert = true
//                completion(false)
//                return
//            }
//            completion(true)
//        }
//    }
//}
