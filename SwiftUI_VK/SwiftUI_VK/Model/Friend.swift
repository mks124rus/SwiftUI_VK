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
        return [Friend(firstName: "Megan", lastName: "Fox", avatar: "fox"),
                Friend(firstName: "Angelina", lastName: "Jolie", avatar: "jolie"),
                Friend(firstName: "John", lastName: "Travolta", avatar: "travolta"),
                Friend(firstName: "Brad", lastName: "Pitt", avatar: "pitt"),
                Friend(firstName: "Jason", lastName: "Statham", avatar: "statham")].lazy.sorted(by: {$0.firstName < $1.firstName})
    }
}
