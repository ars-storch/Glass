//
//  FeedItem.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

struct Post: Identifiable, Codable {
        
    var text = ""
    var likesCount: Int
    var commentsCount: Int
    var comments: [String?]
    var avatarURL: String?
    var imageURL: String
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case text, likesCount, commentsCount, comments, avatarURL, imageURL, id = "???"
    }

    init(text: String, likesCount: Int, commentsCount: Int, comments: [String?], imageURL: String, avatarURL: String) {
        self.text = text
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.comments = comments
        self.imageURL = imageURL
        self.avatarURL = avatarURL
    }
    

}



