//
//  FriendModel.swift
//  DemoNetworking
//
//  Created by Dương Văn Cường on 22/09/2022.
//

import Foundation

struct Friend: Codable {
    let name: String
    let avatar: String
    var isLikeCheck: Bool
    let id: String
}

typealias Friends = [Friend]


struct Food: Decodable {
    let name: String
    let avatar: String
    let id: String
}

typealias Foods = [Food]
