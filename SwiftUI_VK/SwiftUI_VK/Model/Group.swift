//
//  Group.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import Foundation

struct Group: Identifiable {
    
    internal init(name: String, avatar: String){
        self.name = name
        self.avatar = avatar
    }
    
    var id: UUID = UUID()
    var name: String
    var avatar: String
    
    static func creatDemoGroups() -> [Group] {
        return [Group(name: "Apple", avatar: ""),
                Group(name: "AUTO", avatar: ""),
                Group(name: "Music", avatar: ""),
                Group(name: "Radio ENERGY (NRJ)", avatar: ""),
                Group(name: "SMOTRA.RU", avatar: "")]
    }
}
