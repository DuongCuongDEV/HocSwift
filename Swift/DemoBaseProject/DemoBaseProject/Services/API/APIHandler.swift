//
//  APIHandler.swift
//  DemoBaseProject
//
//  Created by Dương Văn Cường on 29/09/2022.
//

import Foundation

class APIHandler {
    func getFriends(completion: @escaping (Friends) -> ()) {
        AF.request("\(BASE_API_URL)\friends", method: .get).responseDecodable(of: Friends.self) { (response) in
            if let friendsResponse = response.value {
                completion(friendsResponse)
            }
            
        }
    }
    
    func updateFriend() {
        AF.request("\(BASE_API_URL)/friends", method: .put).responseDecodable(of: Friends.self) { (response) in
            if let friendsResponse = response.value {
                completion(friendsResponse)
            }
            
        }
    }
    
    
    func getConversations() {
        AF.request("\(BASE_API_URL)\conversations", method: .put).responseDecodable(of: Friends.self) { (response) in
            if let friendsResponse = response.value {
                completion(friendsResponse)
            }
            
        }
    }
}
