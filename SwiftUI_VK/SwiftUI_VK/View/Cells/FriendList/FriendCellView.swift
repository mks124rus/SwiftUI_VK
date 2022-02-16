//
//  FriendCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct FriendCellView: View {
    
    let friend: Friend
    private let insets = Constants().edgeInstets
    private let heightCell = Constants().heightCell
    
    var body: some View {

        HStack{
            FriendNameView(text: friend.firstName + " " + friend.lastName)
                .padding(insets)
            
            Spacer(minLength: 20)
            
            AvatarView(image: friend.avatar)
                .padding(insets)
            
        }.frame(height: heightCell)
    }
}
