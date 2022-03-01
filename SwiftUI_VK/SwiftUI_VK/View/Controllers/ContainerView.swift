//
//  ContainerView.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 16.02.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @ObservedObject var session = Session.shared
    
    var body: some View {
        
        if session.isUserLogin {
            TabBarView()
        } else {
            VKLoginWebView()
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
