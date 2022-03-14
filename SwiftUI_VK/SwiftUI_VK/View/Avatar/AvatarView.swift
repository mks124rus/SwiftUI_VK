//
//  AvatarView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    
    var url: URL?
    
    var body: some View {
        
        KFImage(url)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .background(Image("avatarPlaceHolder")
                            .resizable())
            .clipShape(Circle())
            .modifier(CircleShadow())

        
    }
}
