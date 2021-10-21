//
//  Tutu_ProjectApp.swift
//  Tutu Project
//
//  Created by MacBook Pro on 20/10/21.
//

import SwiftUI

@main
struct Tutu_ProjectApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    let viewModel = HeroesViewModel()
    
    var body: some Scene {
        WindowGroup {
            HeroesView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            
            case .background:
                viewModel.saveData()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Apple must have changed something")
            }
        }
    }
}
