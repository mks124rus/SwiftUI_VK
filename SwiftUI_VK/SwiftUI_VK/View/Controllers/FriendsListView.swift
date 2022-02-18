//
//  FriendsListView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct FriendsListView: View {
    
    @State private var friends: [Friend] = Friend.creatDemoFriends()
    
    private var sectionFriends: Dictionary<String, [Friend]> = [:]
    
    init() {
        sectionFriends = getSectionedDictionary()
    }
    
    var body: some View {
        List{
            ForEach(sectionFriends.keys.sorted(), id: \.self) { key in
                
                Section(header: Text("\(key)")) {
                    
                    if let friends = sectionFriends[key] {
                        ForEach(friends){ friend in
                            
                            NavigationLink(destination: FriendPhotoGalleryView()){
                                FriendCellView(friend: friend)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func getSectionedDictionary() -> Dictionary <String , [Friend]> {
        let sectionFriends: Dictionary<String, [Friend]> = {
            return Dictionary(grouping: friends, by: {
                let name = $0.firstName
                let firstChar = String(name.first!).uppercased()
                return firstChar
            })
        }()
        print(sectionFriends)
        return sectionFriends
    }
    
    
    
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
