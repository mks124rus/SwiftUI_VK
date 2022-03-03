//
//  NetworkManager.swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 01.03.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol APIService {
    func loadFriends(completion: @escaping ([Friend]) -> Void)
    func loadGroups(completion: @escaping ([Group]) -> Void)
    func loadFriendsPhotos(ownerID: Int, completion: @escaping ([Photo]) -> Void)
}

class NetworkManager: APIService {

    let baseURL = "https://api.vk.com"
    let token = Session.shared.token
    let userID = Session.shared.userID
    
    //    static let session: URLSession = {
    //        let config = URLSessionConfiguration.default
    //        config.timeoutIntervalForRequest = 20
    //        let session = URLSession(configuration: config)
    //        return session
    //    }()
    
    func loadFriendsPhotos(ownerID: Int, completion: @escaping ([Photo]) -> Void) {
        let baseURL = baseURL
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": "\(token ?? "")",
            "owner_id": ownerID,
            "album_id" : "wall",
            "extended": "1",
            "rev" : "1",
            "count" : "50",
            "v" : "5.130"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params)
            .responseDecodable(of: Photo.self) {(response) in
                guard let data = response.data else {return}
                
                do {
                    let photosJSON = try JSONDecoder().decode(PhotoResponse.self, from: data)
                    let photos: [Photo] = photosJSON.response.items
                    completion(photos)
                } catch {
                    print(error)
                }
                
            }
        
    }
    
    func loadGroups(completion: @escaping ([Group]) -> Void) {
        let baseURL = baseURL
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": "\(token ?? "")",
            "extended": 1,
            "v" : "5.131"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params)
            .responseDecodable(of: Group.self) { (response) in
                guard let data = response.data else {
                    return
                }
                do {
                    let groupsJSON = try JSONDecoder().decode(GroupResponse.self, from: data)
                    let groups: [Group] = groupsJSON.response.items
                    completion(groups)
                } catch {
                    print(error)
                }
            }
    }
    
    func loadFriends(completion: @escaping ([Friend]) -> Void) {
        let baseURL = baseURL
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": "\(token ?? "")",
            "fields": "photo_50",
            "order": "name",
            "v" : "5.131"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params)
            .responseDecodable(of: Friend.self) { (response) in
                
                guard let data = response.data else {
                    return
                }
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

