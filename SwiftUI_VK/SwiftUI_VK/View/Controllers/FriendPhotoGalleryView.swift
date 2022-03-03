//
//  FriendPhotoGalleryView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI
import Grid
import Kingfisher

struct FriendPhotoGalleryView: View {
    
    @ObservedObject var viewModel: PhotoViewModel
    var friend: Friend
    
    private var style = StaggeredGridStyle(.vertical, tracks: 3, spacing: 5)
    
    init(friend: Friend, viewModel: PhotoViewModel){
        self.viewModel = viewModel
        self.friend = friend
    }
    var body: some View {
        GeometryReader{ screen in
            ScrollView(style.axes) {
                let side = screen.size.width/3
                Grid(viewModel.photos) { photo in
                    NavigationLink(destination: ImageDetailView(url: photo.url)) {
                        VStack{
                            KFImage(photo.url)
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                                .background(Image("photoPlaceholder")
                                                .resizable())
                        }
                        .frame(width: side, height: side, alignment: .center)
                        .clipped()
                    }
                }
            }
            .onAppear(){
                viewModel.fetch(ownerID: friend.id)
            }
        }
        .gridStyle(self.style)
        .navigationTitle("Photos")
    }
}


