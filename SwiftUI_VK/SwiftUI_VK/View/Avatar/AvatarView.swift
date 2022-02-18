//
//  AvatarView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct AvatarView: View {
    var image: String
//    var url: URL?
    var body: some View {
        
        AvatarImage{
            Image(image)
        }
//        AsyncImage(url: url) {image in
//            image
//                .resizable()
//                .scaledToFill()
//                .frame(width: 50, height: 50)
//                .clipShape(Circle())
//                .modifier(CircleShadow())
//        } placeholder: {
//            Image("avatarPlaceHolder")
//                            .resizable()
//                            .scaledToFit()
//                            .clipped()
//        }
    }
}
