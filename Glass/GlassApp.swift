//
//  GlassApp.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI
import Firebase
import SwiftyVK

@main
struct GlassApp: App {
    
    @StateObject var viewModel = AuthFirebase()
    
    init() {
        FirebaseApp.configure()
    }
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
        
    }
}
