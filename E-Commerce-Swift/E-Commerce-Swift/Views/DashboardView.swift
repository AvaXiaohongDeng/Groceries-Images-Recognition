//
//  DashboardView.swift
//  E-Commerce-Swift
//
//  Created by Khoa To on 2024-02-28.
//

import SwiftUI
import FirebaseAuth

struct DashboardView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 170)
                    .padding(.vertical, 32)
                VStack {
                    HStack(spacing: 30) {
                        if let user = viewModel.currentUser {
                            Text(user.fullname)
                        }
                        
                        Text("Phone Number")
                    }
                    .padding()
                    if let user = viewModel.currentUser {
                        Text(user.email)
                    }
                    
                    Spacer()
                    
                    Text("App Version 1.0.0")
                        .padding(.bottom, 8)
                }
                
            }
            .navigationBarTitle("Dashboard", displayMode: .inline)
        }
    }
}

#Preview {
    DashboardView()
}
