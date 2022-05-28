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
    var logo: String?
    var imageURL: String
    var id = UUID()

    init(text: String, likesCount: Int, commentsCount: Int, comments: [String?], imageURL: String, logo: String) {
        
        self.text = text
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.comments = comments
        self.imageURL = imageURL
        self.logo = logo
        
    }
    
}


