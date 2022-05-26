//
//  ContentView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var feed = Feed()
    @State var likesAreAvailable = false
    @State var commentsAreVisible = false
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LogInView()
            } else {
                mainInterfaceView
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .environmentObject(AuthViewModel())
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        TabView{
            FullGlassView(likesAreAvailable: $likesAreAvailable, commentsAreVisible: $commentsAreVisible)
                .tabItem() {
                    Image("GlassFullNav")
                }
            NeutralGlassView(likesAreAvailable: $likesAreAvailable, commentsAreVisible: $commentsAreVisible)
                .tabItem() {
                    Image("GlassNeutralNav")
                }
            EmptyGlassView(likesAreAvailable: $likesAreAvailable, commentsAreVisible: $commentsAreVisible)
                .tabItem() {
                    Image("GlassEmptyNav")
                }
            }
    }
}
