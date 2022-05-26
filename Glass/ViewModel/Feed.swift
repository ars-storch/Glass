//
//  Feed.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

class Feed: ObservableObject {
    
    @Published var posts: [Post] = [
        Post(bigItem: true, socialNetwork: .twitter, text: "This is Elon Musk's first attempt to conquer the world!", likesCount: 4, commentsCount: 1, comments: ["Wow, that's delicious!", "How dare you!"], image: Image("TestPicture")),
        Post(bigItem: false, socialNetwork: .instagram, text: "Oh my God, Poppy, you've shared with me such a lovely story!", likesCount: 70, commentsCount: 4, comments: ["Yes, it was beautiful!"], image: Image("TestPicture"))
    ]
    
    var smallPosts: [Post] {
        get {
            getSmallPosts()
        }
        set {
            getBigPosts()
        }
    }
    var bigPosts: [Post] {
        get {
            getBigPosts()
        }
        set {
            getBigPosts()
        }
    }
    
    func getSmallPosts() -> [Post] {
        var localPosts: [Post] = []
            for post in posts {
                if post.bigItem == true {
                    localPosts.append(post)
                }
            }
        return localPosts
    }
    
    func getBigPosts() -> [Post] {
        var localPosts: [Post] = []
            for post in posts {
                if post.bigItem == false {
                    localPosts.append(post)
                }
            }
        return localPosts
    }
}
