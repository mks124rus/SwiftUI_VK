//
//  FriendPhotoGalleryView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI
import Grid

struct FriendPhotoGalleryView: View {
    
    private let demoPhotos:[Photo] = Photo.creatPhotos()
    private var style = StaggeredGridStyle(.vertical, tracks: 2, spacing: 10)
    
    var body: some View {
        
        ScrollView(style.axes) {
            Grid(self.demoPhotos, id: \.self) { photo in
                NavigationLink(destination: ImageDetailView(imageName: photo.url)) {
                    Image(photo.url)
                        .renderingMode(.original)
                        .resizable()
                        .background(Image("photoPlaceholder")
                                        .resizable())
                        .scaledToFit()
                }
            }
        }.gridStyle(self.style)
            .navigationTitle("Photos")
    }
}

struct FriendPhotoGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotoGalleryView()
    }
}


