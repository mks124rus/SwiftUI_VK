//
//  Photo.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import Foundation

struct PhotoResponse: Codable {
    let response: PhotoItems
}

struct PhotoItems: Codable {
    var items: [Photo]
}

struct Photo: Codable, Identifiable {
    var albumID, date, id, ownerID: Int
    var sizes: [Size]
    var likes: Likes
    
    var url: URL? {
        guard let xSize = sizes.first(where: {$0.type == "x"}) else {return nil}
        return URL(string: xSize.url)
    }

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case sizes
        case likes
    }
}

struct Likes: Codable {
    var userLikes, count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

struct Size: Codable {
    var height: Int
    var url: String
    var type: String
    var width: Int
}

