//
//  FriendNameView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct FriendNameView: View {
    
    var text = "First Name Last Name"
    private let textSize = Constants().textSize
    
    var body: some View {
        
        Text(text)
            .font(.system(size: textSize, weight: .medium))
            .lineLimit(1)
    }
}

struct FriendNameView_Previews: PreviewProvider {
    static var previews: some View {
        FriendNameView()
    }
}
