//
//  Feed.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

class Feed: ObservableObject {
    
    @Published var posts: [Post]
    var apiWorker = APIWorker()
    
    init() {
        self.posts = apiWorker.postsToPresent!
    }
    
}
