//
//  Info.swift
//  BTVN API
//
//  Created by ChâuNT on 27/09/2022.

import Foundation
struct InfoModel: Decodable {
    let name: String
    let avatar: String
    let id: String
    let phone: Int
    let sex: String
}
typealias Infos = [InfoModel]
