//
//  Friend.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import Foundation

struct FriendsResponse: Codable {
    var response: FriendItems
}

struct FriendItems: Codable {
    var items: [Friend]
}

struct Friend: Codable, Identifiable{
    var id: Int
    var firstName, lastName: String
    var avatar: String
    
    var fullName: String {
        return ("\(firstName) \(lastName)")
    }
    
    var avatarUrl: URL? {
        return URL(string: avatar)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_50"
    }
}



#if DEBUG
extension Friend {
    
    static func creatDemoFriends() -> [Friend]  {
        return [Friend(id: 0, firstName: "Megan", lastName: "Fox", avatar: "fox"),
                Friend(id: 1, firstName: "Angelina", lastName: "Jolie", avatar: "jolie"),
                Friend(id: 2, firstName: "John", lastName: "Travolta", avatar: "travolta"),
                Friend(id: 3, firstName: "Brad", lastName: "Pitt", avatar: "pitt"),
                Friend(id: 4, firstName: "Jason", lastName: "Statham", avatar: "statham")].lazy.sorted(by: {$0.firstName < $1.firstName})

    }
}
#endif
