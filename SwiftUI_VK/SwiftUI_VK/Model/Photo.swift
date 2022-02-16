//
//  Photo.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import Foundation

struct Photo: Identifiable, Hashable {
    
    internal init(url: String, ownerID: Int){
        self.url = url
        self.ownerID = ownerID
    }
    
    var id: UUID = UUID()
    var url: String
    var ownerID: Int
    
    static func creatPhotos() -> [Photo]{
        return [Photo(url: "fox", ownerID: 0),
                Photo(url: "pitt", ownerID: 1),
                Photo(url: "statham", ownerID: 2),
                Photo(url: "travolta", ownerID: 3),
                Photo(url: "jolie", ownerID: 4)]
    }

}
