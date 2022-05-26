//
//  SmallPostView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 10.05.2022.
//

import SwiftUI

struct SmallPostView: View {
    @Binding var post: Post
    var body: some View {
        ZStack {
            ZStack{
                VStack {
                    HStack {
                        post.image!
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(30)
                            .padding([.leading], 10)
                        Text("@thisusername")
                            .font(.bold(Font.caption2)())
                        Spacer()
                    }
                    HStack {
                        Text(post.text)
                            .font(.bold(Font.title3)())
                            .frame(width: 200, height: 150)
//                            .padding(.leading)
                        VStack {
                            post.image?
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.top, 30)
                                .padding(.trailing, 15)
                                .padding(.leading, 15)

                        }
                    }
                    .padding(.bottom, 10)
                    HStack {
                        // Read button
                        Button("Read") {
                            // ACTION
                        }
                        .foregroundColor(.black)
                        .frame(width: 50)
                        .background(Color(white: 0.85))
                        .cornerRadius(20)
                        .font(Font.bold(Font.body)())
                        Spacer()
                        
                        // Like
                        Group {
                            Image("LikeEmpty")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 10)
                            Text(String(post.likesCount))
                        }
                        
                        //Comment
                        Group {
                            Image("CommentEmpty")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(String(post.commentsCount))
                        }
                        Spacer()
                        post.logo?
                            .resizable()
                            .frame(width: 25, height: 25)

                        // Source button
                        Button("Source") {
                            // ACTION
                        }
                        .foregroundColor(.black)
                        .frame(width: 65)
                        .background(Color(white: 0.85))
                        .cornerRadius(20)
                        .font(Font.bold(Font.body)())
                        .padding(.trailing, 10)
                    }.padding(.leading,10).padding(.trailing, 10)
                }.frame(width: 350, height: 100)
            }
            .frame(width: 350, height: 150)
        }
        .padding(50)
    }
}

struct SmallPostView_Previews: PreviewProvider {
    static var previews: some View {
        SmallPostView(post: .constant(Post(bigItem: true, socialNetwork: .twitter, text: "Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting!", likesCount: 3, commentsCount: 0, comments: [nil], image: Image("TestPicture"))))
    }
}
