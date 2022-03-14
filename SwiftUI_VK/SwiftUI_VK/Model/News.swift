//
//  News.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 03.03.2022.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    var response: NewsItems
}

// MARK: - NewsItems
struct NewsItems: Codable {
    var items: [News]
    var profiles: [Friend]
    var groups: [Group]
    var nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
        case nextFrom = "next_from"
    }
}

// MARK: - News
class News: Codable, Identifiable {
    var id, date: Int
    var postType: PostTypeEnum
    var text: String
    var attachments: [ItemAttachment]?
    var postSource: PostSource
    var comments: Comments
    var likes: Likes
    var reposts: Reposts
    var views: Views
    var postID: Int
    var type: PostTypeEnum
    
    var avatarURL: URL?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "source_id"
        case date
        case postType = "post_type"
        case text
        case attachments
        case postSource = "post_source"
        case comments, likes, reposts, views
        case postID = "post_id"
        case type
        case avatarURL
        case name
    }
}

// MARK: - ItemAttachment
struct ItemAttachment: Codable{

    var type: AttachmentType {
        return .photo
    }
    var photo: Photo?
        
    enum AttachmentType: String, Codable {
        case photo = "photo"
    }
}



// MARK: - Comments
struct Comments: Codable {
    var count: Int

    enum CodingKeys: String, CodingKey {
        case count
    }
}

// MARK: - PostSource
struct PostSource: Codable {
    var platform: String?
    var type: PostSourceType {
        return .api
    }
}

enum PostSourceType: String, Codable {
    case api = "api"
    case vk = "vk"
}

enum PostTypeEnum: String, Codable {
    case post = "post"
}

// MARK: - Reposts
struct Reposts: Codable {
    var count: Int

    enum CodingKeys: String, CodingKey {
        case count
    }
}

// MARK: - Views
struct Views: Codable {
    var count: Int
    
    enum CodingKeys: String, CodingKey {
        case count
    }
}
