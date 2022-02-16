//
//  GroupsListView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct GroupsListView: View {
    
    @State var groups:[Group] = Group.creatDemoGroups()
    
    var body: some View {
        List(groups){ group in
            GroupCellView(group: group)
        }
        .listStyle(.plain)
    }
}

struct GroupsListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView()
    }
}
