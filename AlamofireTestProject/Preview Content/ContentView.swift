import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @State private var isAuthenticated = Auth.auth().currentUser != nil
  //  @State private var showPhoneAuth = false

    var body: some View {
        if isAuthenticated {
            //MoviesView(isAuthenticated: $isAuthenticated, showPhoneAuth: $showPhoneAuth)
            MoviesView(isAuthenticated: $isAuthenticated)
        } else {
            //LoginView(isAuthenticated: $isAuthenticated, showPhoneAuth: $showPhoneAuth)
            LoginView(isAuthenticated: $isAuthenticated)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
