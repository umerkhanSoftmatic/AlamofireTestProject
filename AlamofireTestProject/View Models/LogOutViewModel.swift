import Foundation

//import SwiftUI
//import FirebaseAuth
//
//class LogOutViewModel: ObservableObject {
//    func logout(isAuthenticated: Binding<Bool>) {
//        do {
//            try Auth.auth().signOut()
//            isAuthenticated.wrappedValue = false
//        } catch let signOutError as NSError {
//            print("Error signing out: \(signOutError.localizedDescription)")
//        }
//    }
//}


import FirebaseAuth

class LogOutViewModel: ObservableObject {
    var onLogout: (() -> Void)?

    func logout() {
        do {
            try Auth.auth().signOut()
            onLogout?() 
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
}
