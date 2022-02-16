//
//  FriendPhotoGalleryView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI
import QGrid

struct FriendPhotoGalleryView: View {
    
    private let demoPhotos:[Photo] = Photo.creatPhotos()
    
    var body: some View {
        
        QGrid(demoPhotos, columns: 3) { photo in
            FriendPhotoGalleryCellView(demoPhoto: photo)
        }
        .navigationBarTitle("Photos")
        .padding([.horizontal, . top], 7)
    }
}

struct FriendPhotoGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotoGalleryView()
    }
}
