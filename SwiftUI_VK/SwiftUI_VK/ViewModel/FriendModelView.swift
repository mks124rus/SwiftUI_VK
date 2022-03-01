//
//  FriendModelView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 01.03.2022.
//

import Combine

class FriendModelView: ObservableObject {
    @Published var friends: [Friend] = []
    
    private let networkManager = NetworkManager()
    
    public func fetch() {
        networkManager.loadFriends { data in
            let dataFiltered = data.filter{$0.firstName != "DELETED"}
            self.friends = dataFiltered
        }
    }
}

