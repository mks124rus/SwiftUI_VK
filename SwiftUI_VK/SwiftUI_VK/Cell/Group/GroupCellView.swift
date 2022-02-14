//
//  GroupCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct GroupCellView: View {
    
    private let insets = Constants().edgeInstets
    private let heightCell = Constants().heightCell
    
    var body: some View {
        HStack{
            GroupNameView()
                .padding(insets)
            
            Spacer(minLength: 20)
            
            AvatarView()
                .padding(insets)
            
        }.frame(height: heightCell)
        //удалить
            .border(.black)
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView()
    }
}
