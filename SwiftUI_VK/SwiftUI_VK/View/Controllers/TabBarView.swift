//
//  TabBarView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = 0
    var body: some View {
        
        TabView(selection: $selection ){
            
            NavigationView{
                NewsFeedListView()
                    .navigationBarTitle("News", displayMode: .inline)
            }
            .tabItem{
                Image(systemName: "newspaper")
                Text("News")
            }
            
            
            NavigationView{
                FriendsListView()
                    .navigationBarTitle("Friends", displayMode: .inline)
            }
            .tabItem{
                Image(systemName: "person.fill.badge.plus")
                Text("Friends")
            }
            
            NavigationView {
                GroupsListView()
                    .navigationBarTitle("Groups", displayMode: .inline)
            }
            .tabItem{
                Image(systemName: "person.3.fill")
                Text("Groups")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
            TabBarView()
    }
}
