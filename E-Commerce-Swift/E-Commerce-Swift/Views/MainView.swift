//
//  ContentView.swift
//  E-Commerce-Swift
//
//  Created by Khoa To on 2024-02-28.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.currentUser {
                    Text("Welcome \(user.fullname)!").font(.title)
                }
                
                Image(systemName: "photo.on.rectangle.angled") // Placeholder for item picture
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                
                VStack(spacing: 20) { // Add spacing between buttons
                    Button(action: {
                        // Action for take picture
                    }, label: {
                        Text("TAKE PICTURE")
                            .font(.title2)
                    })
                    .buttonStyle(.borderedProminent)
                    .frame(height: 50) // Set the height for the button
                    
                    Button(action: {
                        // Action for upload picture
                    }, label: {
                        Text("UPLOAD PICTURE")
                            .font(.title2)
                    })
                    .buttonStyle(.borderedProminent)
                    .frame(height: 50) // Set the height for the button
                }
                .padding(.horizontal) // Add horizontal padding to the VStack containing buttons
                
                
            }
            .padding(.bottom, 32) // Add padding at the bottom of the VStack
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(trailing:
                                    NavigationLink(destination: DashboardView().environmentObject(viewModel)) {
                Text("Dashboard")
            }
            )
        }
    }
}

#Preview {
    MainView()
}
