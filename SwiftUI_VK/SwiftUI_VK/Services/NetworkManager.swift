//
//  NetworkManager.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 01.03.2022.
//

import Foundation
import Alamofire

protocol APIService {
    func loadFriends(completion: @escaping ([Friend]) -> Void)
}

class NetworkManager: APIService {
    
    let token = Session.shared.token
    let userID = Session.shared.userID
    
    static let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        let session = URLSession(configuration: config)
        return session
    }()
    
    func loadFriends(completion: @escaping ([Friend]) -> Void) {
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": "\(token ?? "")",
            "fields": "photo_50",
            "order": "name",
            "v" : "5.131"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseDecodable(of: Friend.self) { (response) in

            guard let data = response.data else {return}
            do {
                let friendsJSON = try JSONDecoder().decode(FriendsResponse.self, from: data)
                let friends: [Friend] = friendsJSON.response.items
                completion(friends)
            } catch {
                print(error)
            }
            
        }
    }
}
    
