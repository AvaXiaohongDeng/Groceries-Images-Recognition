//
//  LaunchView.swift
//  E-Commerce-Swift
//
//  Created by Khoa To on 2024-03-14.
//

import SwiftUI

struct LaunchView: View {

    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainView().environmentObject(viewModel)
            }
            else {
                LoginView()
            }
        }
        
    }
}

#Preview {
    LaunchView()
}
