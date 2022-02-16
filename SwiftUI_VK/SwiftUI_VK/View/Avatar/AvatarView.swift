//
//  AvatarView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.02.2022.
//

import SwiftUI

struct AvatarView: View {
    var image: String
    
    var body: some View {
        
        AvatarImage{
            Image(image)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image: "")
    }
}
