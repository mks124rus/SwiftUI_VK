//
//  FriendPhotoGalleryView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI
import Grid

struct FriendPhotoGalleryView: View {
    
    private let photos:[Photo] = Photo.creatDemoPhotos()
    private var style = StaggeredGridStyle(.vertical, tracks: 3, spacing: 5)
    
    var body: some View {
        
        ScrollView(style.axes) {
            Grid(photos) { photo in
                NavigationLink(destination: ImageDetailView(imageName: photo.url)) {
                    VStack{
                        Image(photo.url)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .background(Image("photoPlaceholder")
                                            .resizable())
                    }
                    .frame(width: 125, height: 125, alignment: .center)
                    .clipped()
                    
                }
            }
        }
        .gridStyle(self.style)
        .navigationTitle("Photos")
    }
}

struct FriendPhotoGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotoGalleryView()
    }
}


