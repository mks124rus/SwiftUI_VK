//
//  FriendCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct FriendCellView: View {
    
    let friend: Friend
    private let heightCell = Constants().heightCell
    
    var body: some View {

        HStack{
            FriendNameView(text: friend.fullName)
            
            Spacer(minLength: 20)
            
            AvatarView(url: friend.avatarUrl)
            
        }.frame(height: heightCell)
    }
}
