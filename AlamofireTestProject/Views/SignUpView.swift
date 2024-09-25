import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @Binding var isAuthenticated: Bool
    //@Binding var showPhoneAuth: Bool
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding()
            
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding()

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding()

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding()

            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .padding()

            Button(action: {
                viewModel.signUp { success in
                    if success {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }) {
                Text("Register")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Sign Up Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
            
            
            
//            Button(action: {
//                
//                showPhoneAuth = true
//            }) {
//                Text("Sign up with Phone Number")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.orange)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//            .sheet(isPresented: $showPhoneAuth) {
//                PhoneAuthView()
//            }

            

            Spacer()
        }
        .padding()
    }
}



