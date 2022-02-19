//
//  NewsFeedListView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 18.02.2022.
//

import SwiftUI

struct NewsFeedListView: View {
    var body: some View {
        List {
            ForEach (1..<4) {_ in
                NewsFeedCellView()
            }
        }
        .listStyle(.plain)
    }
    
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedListView()
    }
}
