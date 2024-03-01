//
//  SignupView.swift
//  E-Commerce-Swift
//
//  Created by Khoa To on 2024-02-28.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

struct SignupView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var fullname : String = ""
    @State private var confirmPassword : String = ""
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter you password", isSecureField: true)
                        .autocapitalization(.none)
                    
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                        .autocapitalization(.none)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button(action: {
                    //Sign up using FirebaseAuth
//                    Task {
//                        try await viewModel.signUp(withEmail: email, password: password, fullname: fullname)
//                    }
                }){
                    HStack {
                        Text("Create Account")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .padding(.top, 24)
                
                Spacer()
                
                //Navigate to Sign in View
                NavigationLink {
                    LoginView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
            } //VStack
            .padding()
        } //NavigationStack
        .navigationBarTitle("E-Commerce Recognition", displayMode: .inline)
        
    }//body
}

// Form validation
extension SignupView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}


#Preview {
    SignupView()
}
