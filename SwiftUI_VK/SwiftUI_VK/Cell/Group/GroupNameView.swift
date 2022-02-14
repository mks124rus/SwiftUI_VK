//
//  GroupNameView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct GroupNameView: View {
    
    var text = "Group Name"
    private let font = Constants().font
    
    var body: some View {
        
        Text(text)
            .font(font)
            .lineLimit(1)
    }
}

struct GroupNameView_Previews: PreviewProvider {
    static var previews: some View {
        GroupNameView()
    }
}
