//
//  NewsFeedListView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 18.02.2022.
//

import SwiftUI

struct NewsFeedListView: View {
    @ObservedObject var viewModel: NewsViewModel
    
    init(viewModel: NewsViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach (viewModel.news) {news in
                NewsFeedCellView(news: news )
            }
        }
        .onAppear(){
            viewModel.fetch()
        }
        .listStyle(.plain)
    }
}
