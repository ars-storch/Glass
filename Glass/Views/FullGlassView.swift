//
//  FeedView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

struct FullGlassView: View {
    
    @EnvironmentObject var viewModel: AuthFirebase
    @Binding var posts: [Post]
    @Binding var likesAreAvailable: Bool
    @Binding var commentsAreVisible: Bool
    var likesCount: Int?
    
    var body: some View {

                VStack {
                    HStack {
                        Image("GlassFull")
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
                        Text("Your glass is full!")
                            .font(.bold(Font.largeTitle)())
                            .padding(.leading, 22)
                        Spacer()
                    }
                    List {
                        ForEach($posts) { post in
                            PostView(post: post)
                        }
                            .padding(.top, 20)
                            .frame(width: 320, height: .infinity)
                    }.listStyle(.automatic)
                }
            }
}
