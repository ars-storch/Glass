//
//  BigPostView.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

// 1) A parent view proposes a size to its child.
// 2) Child can choose its own size. Parent must respect that choice.
// 3) A parent position a child in its own coordinsate space.
// 4) Size of ContentView is the size of the body property.

struct PostView: View {
    @Binding var post: Post
    var body: some View {
        
        VStack{
            HStack{
                AsyncImage(url: URL(string: post.imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "HERE SHOULD BE LOADING IMAGE")
                }
                    .frame(width: 30, height: 30)
                    .cornerRadius(30)
                    .padding([.leading], 10)
                Text("@thisusername")
                    .font(.bold(Font.caption)())
                Spacer()
            }
            ZStack{
                VStack{
//                    AsyncImage(url: URL(string: post.imageURL)) { image in
//                        image.resizable()
//                    } placeholder: {
//                        Image(systemName: "HERE SHOULD BE LOADING IMAGE")
//                    }
//                        .frame(height: 150)
//                        .cornerRadius(30)
                    ZStack{
                        RoundedRectangle(cornerRadius: 0)
                            .background(.white)
                            .foregroundColor(.white)
                            .frame(height: 150)
                        HStack{
                           ExpandableText(post.text, lineLimit: 6)
                                    .font(.bold(Font.title3)())
                            }
                            
                    }
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
                        AsyncImage(url: URL(string: post.avatarURL!)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "HERE SHOULD BE LOADING IMAGE")
                        }
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
                    }
                }

            }
            .frame(width: .infinity, height: .infinity)
        }
        // End of ZStack.
    }
}

struct BigPostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .constant(Post(text: "Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting! Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting! Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting! Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting! Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting! Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting! Oh, Mary! This last night was awesome, we had such a good vide together! I almost miss you and can't wait the moment of our next meeting!", likesCount: 3, commentsCount: 0, comments: [nil], imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/1200px-Google_Chrome_icon_%28February_2022%29.svg.png", avatarURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Google_Chrome_icon_%28February_2022%29.svg/1200px-Google_Chrome_icon_%28February_2022%29.svg.png")))
    }
}
