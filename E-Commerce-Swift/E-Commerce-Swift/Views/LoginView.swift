//
//  LoginView.swift
//  E-Commerce-Swift
//
//  Created by Khoa To on 2024-02-28.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var showSignup = false
    @State private var shouldNavigate = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter you password", isSecureField: true)
                        .autocapitalization(.none)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button(action: {
                    //login using FirebaseAuth
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                    self.shouldNavigate = true
                }){
                    HStack {
                        Text("Login")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .background(
                    NavigationLink(destination: MainView(), isActive: $shouldNavigate) {
                        EmptyView()
                    }
                    .hidden()
                    )
                .padding(.top, 24)
                
                Spacer()
                
                //Navigate to Sign up View
                NavigationLink {
                    SignupView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
            } //VStack
            .padding()
        } //NavigationStack
        .navigationBarTitle("E-Commerce Recognition", displayMode: .inline)
        
    } //body
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}