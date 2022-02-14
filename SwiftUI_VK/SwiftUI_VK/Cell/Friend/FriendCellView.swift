//
//  FriendCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct FriendCellView: View {
    
    private let insets = Constants().edgeInstets
    private let heightCell = Constants().heightCell
    
    var body: some View {

        HStack{
            FriendNameView()
                .padding(insets)
            
            Spacer(minLength: 20)
            
            AvatarView()
                .padding(insets)
            
        }.frame(height: heightCell)
        //удалить
            .border(.black)
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView()
    }
}
