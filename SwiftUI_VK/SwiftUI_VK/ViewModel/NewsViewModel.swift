//
//  NewsViewModel.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 03.03.2022.
//

import Combine

class NewsViewModel: ObservableObject {
    
    @Published var news: [News] = []
    
    private let networkManager = NetworkManager()
    
    public func fetch() {
        networkManager.loadNewsFeeds{ [weak self] news in
            self?.news = news
        }
    }
}
