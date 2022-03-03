//
//  PhotoViewModel.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 02.03.2022.
//

import Combine
import SwiftUI

class PhotoViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    
    private let networkManager = NetworkManager()
    
    public func fetch(ownerID: Int) {
        networkManager.loadFriendsPhotos(ownerID: ownerID){ [weak self] photos in
            self?.photos = photos
        }
    }
}
