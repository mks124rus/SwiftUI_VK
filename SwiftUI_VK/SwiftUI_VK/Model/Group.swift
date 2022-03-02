//
//  Group.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import Foundation

// MARK: - GroupResponse
struct GroupResponse: Codable {
    var response: GroupItems
}

// MARK: - GroupItems
struct GroupItems: Codable {
    var count: Int
    var items: [Group]
}

// MARK: - Group
struct Group: Codable, Identifiable {
    var id: Int
    var name, screenName: String
    var isClosed: Int
    var avatar: String
    
    var avatarUrl: URL? {
        return URL(string: avatar)
    }

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case avatar = "photo_50"
    }
}
