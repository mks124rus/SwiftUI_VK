//
//  FriendViewModel.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 01.03.2022.
//

import Combine

class FriendViewModel: ObservableObject {
    @Published var friends: [Friend] = []
    
    private let networkManager = NetworkManager()
    
    public func fetch() {
        networkManager.loadFriends { friends in
            let friendsFiltered = friends.filter{$0.firstName != "DELETED"}
            self.friends = friendsFiltered
        }
    }
}

