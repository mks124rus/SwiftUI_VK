//
//  ImageDetailView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI
import Kingfisher

struct ImageDetailView: View {
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
    }
}
