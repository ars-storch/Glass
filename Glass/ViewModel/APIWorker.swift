//
//  Networking.swift
//  Glass
//
//  Created by Арсений Сторчевой on 12.05.2022.
//

import SwiftUI
import SwiftyVK

class APIWorker: SwiftyVKDelegate {
    
    static let apiKey = "7844675"
    var postsToPresent: [Post]? = []
    
    init() {
        VK.setUp(appId:"7844675", delegate: self)
        postsToPresent = getFeed()
    }
    
    func vkNeedsScopes(for sessionId: String) -> Scopes {
        return Scopes([.friends, .wall])
    }
    
    func vkNeedToPresent(viewController: VKViewController) {
        return
    }
    
    func authorize() {
        VK.sessions.default.logIn(
            onSuccess: { info in
                print("SwiftyVK: success authorize with", info)
            },
            onError: { error in
                print("SwiftyVK: authorize failed with", error)
            }
        )
    }
    
    static func statAuth() {
        VK.sessions.default.logIn(
            onSuccess: { info in
                print("SwiftyVK: success authorize with", info)
            },
            onError: { error in
                print("SwiftyVK: authorize failed with", error)
            }
        )
    }
    
    func getFeed() -> [Post] {
        authorize()
        var myPosts = [Post(text: "Demo", likesCount: 0, commentsCount: 0, comments: ["Comments"], imageURL: "some", avatarURL: "Some")]
        VK.API.NewsFeed.get(.empty)
                    .onSuccess { response in
                        print("We've got the response.")
                        print(response)
                        let posts: [Post] = try! JSONDecoder().decode([Post].self, from: response)
                        myPosts = posts
                    }
                    .onError { error in
                        print("Error occured: \(error.localizedDescription)")
                    }
                    .send()
        return myPosts
    }
}
