//
//  TrasnlateMeApp.swift
//  TrasnlateMe
//
//  Created by Topu Saha on 4/3/24.
//

import SwiftUI
import FirebaseCore



@main
struct TrasnlateMeApp: App {
    
    init() { // <-- Add an init
            FirebaseApp.configure() // <-- Configure Firebase app
        }
    
    
    var body: some Scene {
        WindowGroup {
            HomePageView()
        }
    }
}
