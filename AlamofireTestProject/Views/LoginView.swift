import SwiftUI
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

struct LoginView: View {
    @Binding var isAuthenticated: Bool
    @StateObject var viewModel = LoginViewModel()

    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var showSignUp = false

    var body: some View {
        NavigationView {
            VStack {
            
                Text("Login")
                    .font(.largeTitle)
                    .padding()

              
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()

                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()

              
                Button(action: {
                    viewModel.login { success in
                        if success {
                            isAuthenticated = true
                        } else {
                            alertMessage = "Invalid email or password"
                            showAlert = true
                        }
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

               
                Button(action: {
                    showSignUp = true
                }) {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showSignUp) {
                    SignUpView(isAuthenticated: $isAuthenticated)
                }

               
                Button(action: {
                    signInWithGoogle()
                }) {
                    Text("Sign in with Google")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .padding()
        }
    }
    
    private func signInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { signResult, error in
            
            if let error = error {
                print("Error during sign in: \(error.localizedDescription)")
                return
            }
            
            guard let user = signResult?.user,
                  let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase sign-in error: \(error.localizedDescription)")
                    return
                }
               
                print("User signed in: \(authResult?.user.uid ?? "")")
                isAuthenticated = true
            }
        }
    }
}
