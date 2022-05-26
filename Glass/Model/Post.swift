//
//  FeedItem.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

// In Codable we can't save our own sctructures and Images

struct Post: Identifiable {
    
    var bigItem: Bool = false
    var socialNetwork: SocialNetwork
    var text = ""
    var likesCount: Int
    var commentsCount: Int
    var comments: [String?]
    var logo: Image?
    var image: Image?
    let id = UUID()

    struct SomeImage: Codable {

        public let photo: Data
        
        public init(photo: UIImage) {
            self.photo = photo.pngData()!
        }
    }
    
    enum SocialNetwork: Int, Codable {
        case twitter, instagram
    }
    
    init(bigItem: Bool, socialNetwork: SocialNetwork, text: String, likesCount: Int, commentsCount: Int, comments: [String?], image: Image) {
        
        self.bigItem = bigItem
        self.text = text
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.comments = comments
        self.socialNetwork = socialNetwork
        self.image = image
        
        switch(socialNetwork) {
        case .twitter:
            self.logo = Image("Twitter")
        case .instagram:
            self.logo = Image("Instagram")
        }
    }
    
}


