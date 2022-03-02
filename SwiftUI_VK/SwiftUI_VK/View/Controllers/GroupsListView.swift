//
//  GroupsListView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct GroupsListView: View {
    
    @ObservedObject var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.groups){ group in
            GroupCellView(group: group)
        }
        .listStyle(.plain)
        .onAppear(){
            viewModel.fetch()
        }
    }
}
