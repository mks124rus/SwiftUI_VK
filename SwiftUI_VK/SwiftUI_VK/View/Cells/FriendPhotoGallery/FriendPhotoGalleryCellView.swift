//
//  FriendPhotoGalleryCellView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct FriendPhotoGalleryCellView: View {
    
    var demoPhoto: Photo
    var placeHoler = "photoPlaceholder"
 
    var body: some View{
        
        Image(demoPhoto.url)
            .resizable()
            .background(Image("photoPlaceholder")
                            .resizable())
            .scaledToFit()
            .clipped()
            .shadow(color: .black, radius: 2)
        
    }
}
