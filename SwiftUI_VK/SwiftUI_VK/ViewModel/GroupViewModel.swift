//
//  GroupViewModel.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 02.03.2022.
//

import Combine

class GroupViewModel: ObservableObject {
    
    @Published var groups: [Group] = []
    
    private let networkManager = NetworkManager()
    
    public func fetch() {
        networkManager.loadGroups{ groups in
            self.groups = groups
        }
    }
}
