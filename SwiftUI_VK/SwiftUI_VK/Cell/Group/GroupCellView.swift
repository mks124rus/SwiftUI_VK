//
//  GroupCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct GroupCellView: View {
    
    let group: Group
    
    private let insets = Constants().edgeInstets
    private let heightCell = Constants().heightCell
    
    var body: some View {
        HStack{
            GroupNameView(text: group.name)
                .padding(insets)
            
            Spacer(minLength: 20)
            
            AvatarView()
                .padding(insets)
            
        }.frame(height: heightCell)
    }
}
