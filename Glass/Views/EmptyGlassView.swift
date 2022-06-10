//
//  FeedView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

struct EmptyGlassView: View {
    
    @EnvironmentObject var viewModel: AuthFirebase
    @Binding var posts: [Post]
    @Binding var likesAreAvailable: Bool
    @Binding var commentsAreVisible: Bool
    
    var body: some View {

            VStack {
                HStack {
                    Image("GlassEmpty")
                        .padding(.leading, 10)
                    Image("GlassTitle")
                    Spacer()
                    Button(action: {viewModel.signOut()}) {
                        Image(systemName: "chevron.backward.circle.fill")
                            .foregroundColor(.black)
                    }
                    Button(action: {likesAreAvailable.toggle()}) {
                        likesAreAvailable ? Image("LikeEmpty") : Image("LikeFull")
                    }
                    Button(action: {commentsAreVisible.toggle()}) {
                        commentsAreVisible ? Image("CommentEmpty") : Image("CommentFull")
                    }
                    .padding(.trailing, 10)
                }
                HStack {
                    Text("Danger zone")
                        .font(.bold(Font.largeTitle)())
                        .padding(.leading, 22)
                    Spacer()
                }
                List { // AsyncImage
                    ForEach($posts) { post in
                        PostView(post: post)
                    }
                    .padding(.top, 20)
                    .frame(width: 320, height: 365)
                }.listStyle(.automatic)
            }
    }
}
