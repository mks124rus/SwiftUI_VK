//
//  CircleShadow.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    
    let color: Color = .black
    let radius: CGFloat = 3
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                            .fill(Color.gray)
                            .shadow(color: color, radius: radius))
    }
}
