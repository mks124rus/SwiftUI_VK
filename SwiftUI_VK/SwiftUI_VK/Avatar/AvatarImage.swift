//
//  AvatarImage.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct AvatarImage: View {
    
    var content: Image
    
    let squareSide: CGFloat = 50
    
    let strokeBorderColor = Color.black
    let strokeLineWidth: CGFloat = 2
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .aspectRatio(1.0, contentMode: .fill)
            .frame(width: squareSide, height: squareSide)
            .clipShape(Circle())
            .modifier(CircleShadow())
            .overlay(Circle()
                        .stroke(strokeBorderColor,lineWidth: strokeLineWidth))

    }
}
