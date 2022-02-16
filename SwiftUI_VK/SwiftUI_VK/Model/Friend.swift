//
//  Friend.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import Foundation

struct Friend: Identifiable {
    
    internal init (firstName: String, lastName: String, avatar: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
    
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var avatar: String
    
    static func creatDemoFriends() -> [Friend]  {
        return [Friend(firstName: "Megan", lastName: "Fox", avatar: ""),
                Friend(firstName: "Jolie", lastName: "Angelina", avatar: ""),
                Friend(firstName: "John", lastName: "Travolta", avatar: ""),
                Friend(firstName: "Brad", lastName: "Pitt", avatar: ""),
                Friend(firstName: "Jason", lastName: "Statham", avatar: "")].lazy.sorted(by: {$0.firstName < $1.firstName})
    }
}
