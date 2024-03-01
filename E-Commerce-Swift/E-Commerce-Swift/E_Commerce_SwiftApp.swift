//
//  E_Commerce_SwiftApp.swift
//  E-Commerce-Swift
//
//  Created by Khoa To on 2024-02-28.
//

import SwiftUI
import Firebase
import FirebaseFirestore

@main
struct E_Commerce_SwiftApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
