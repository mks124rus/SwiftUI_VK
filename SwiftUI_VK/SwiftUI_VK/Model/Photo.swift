//
//  Photo.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import Foundation

struct Photo: Identifiable, Hashable {

    internal init(url: String, ownerID: Int){
        self.url = url
        self.ownerID = ownerID
    }

    var id: UUID = UUID()
    var url: String
    var ownerID: Int

    static func creatDemoPhotos() -> [Photo]{
        return [Photo(url: "fox", ownerID: 0),
                Photo(url: "pitt", ownerID: 1),
                Photo(url: "statham", ownerID: 2),
                Photo(url: "travolta", ownerID: 3),
                Photo(url: "jolie", ownerID: 4)]
    }

}

//struct PhotoItems: Codable {
//    var items: Photo
//}
//
//struct Photo: Codable, Identifiable {
//    var albumID, date, id, ownerID: Int
//    var sizes: [Size]
//    var likes: Likes
//
//    enum CodingKeys: String, CodingKey {
//        case albumID
//        case date, id
//        case ownerID
//        case sizes
//        case likes
//    }
//}
//
//struct Likes: Codable {
//    var userLikes, count: Int
//
//    enum CodingKeys: String, CodingKey {
//        case userLikes
//        case count
//    }
//}
//
//struct Size: Codable {
//    var height: Int
//    var url: String
//    var type: String
//    var width: Int
//}

