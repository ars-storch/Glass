//
//  ContentView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var apiModel = APIWorker()
    @EnvironmentObject var viewModel: AuthFirebase
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
                .environmentObject(AuthFirebase())
    }
}

extension ContentView {

    var mainInterfaceView: some View {
        TabView{
            FullGlassView(posts: $feed.posts, likesAreAvailable: $likesAreAvailable, commentsAreVisible: $commentsAreVisible)
                .tabItem() {
                    Image("GlassFullNav")
                }
            NeutralGlassView(posts: $feed.posts, likesAreAvailable: $likesAreAvailable, commentsAreVisible: $commentsAreVisible)
                .tabItem() {
                    Image("GlassNeutralNav")
                }
            EmptyGlassView(posts: $feed.posts, likesAreAvailable: $likesAreAvailable, commentsAreVisible: $commentsAreVisible)
                .tabItem() {
                    Image("GlassEmptyNav")
                }
        }
    }
}
