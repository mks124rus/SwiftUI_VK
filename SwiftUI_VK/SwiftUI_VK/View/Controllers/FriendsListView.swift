//
//  FriendsListView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @ObservedObject var viewModel: FriendViewModel
    
//    private var sectionFriends: Dictionary<String, [Friend]> = [:]
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
//        self.sectionFriends = getSectionedDictionary()
    }
    
    var body: some View {
        
        List(viewModel.friends){ friend in
            NavigationLink(destination: FriendPhotoGalleryView()){
                FriendCellView(friend: friend)
            }
        }
        .listStyle(.plain)
        .onAppear() {
            viewModel.fetch()
        }
    }
    
//    private func getSectionedDictionary() -> Dictionary <String , [Friend]> {
//        let sectionFriends: Dictionary<String, [Friend]> = {
//            return Dictionary(grouping: viewModel.friends, by: {
//                let name = $0.firstName
//                let firstChar = String(name.first!).uppercased()
//                return firstChar
//            })
//        }()
////        print(sectionFriends)
//        return sectionFriends
//    }
}
