//
//  FriendsListView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @State private var friends: [Friend] = Friend.creatDemoFriends()
    
    var body: some View {
        List(friends){ friend in
            FriendCellView(friend: friend)
        }
        .listStyle(.plain)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
