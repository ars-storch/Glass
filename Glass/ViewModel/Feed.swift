//
//  Feed.swift
//  Glass
//
//  Created by Арсений Сторчевой on 09.05.2022.
//

import SwiftUI

// В NetworkManager должна быть функция, возвращающая [Post]. Здесь мы уже только присваеваем переменной @Published var posts: [Post] = NetworkManager().getPosts. Ближайщая задача - написать эту функцию в NetworkManager.

class Feed: ObservableObject {
    
    let networkManager = NetworkManager()
    
    @Published var posts: [Post] = [
        Post(text: "This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!This is Elon Musk's first attempt to conquer the world!", likesCount: 4, commentsCount: 1, comments: ["Wow, that's delicious!", "How dare you!"], imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/CK_Calvin_Klein_logo.svg/1643px-CK_Calvin_Klein_logo.svg.png", logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/CK_Calvin_Klein_logo.svg/1643px-CK_Calvin_Klein_logo.svg.png"),
        Post(text: "Oh my God, Poppy, you've shared with me such a lovely story!", likesCount: 70, commentsCount: 4, comments: ["Yes, it was beautiful!"], imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/CK_Calvin_Klein_logo.svg/1643px-CK_Calvin_Klein_logo.svg.png", logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/CK_Calvin_Klein_logo.svg/1643px-CK_Calvin_Klein_logo.svg.png")
    ]
    
    struct PostForView {
        
    }
    
}
