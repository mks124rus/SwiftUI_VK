//
//  Session.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 01.03.2022.
//

import Foundation

final class Session: ObservableObject{
    
    static let shared = Session()
    
    private init(){}
    
    @Published var token: String?
    @Published var userID: Int?
    @Published var isUserLogin:Bool = false
    
}
