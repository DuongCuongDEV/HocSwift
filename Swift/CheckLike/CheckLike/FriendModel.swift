//
//  FriendModel.swift
//  CheckLike
//
//  Created by Dương Văn Cường on 28/09/2022.
//

import Foundation

struct Friend: Codable {
    let name: String
    let avatar: String
    var isLikeCheck: Bool
    let id: String
}

typealias Friends = [Friend]
