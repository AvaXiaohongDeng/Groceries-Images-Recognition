//
//  DashboardView.swift
//  E-Commerce-Swift
//
//  Created by Khoa To on 2024-02-28.
//

import SwiftUI

struct DashboardView: View {
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
                        Text("Username")
                        
                        Text("Phone Number")
                    }
                    .padding()
                    Text("Email Address")
                    
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
