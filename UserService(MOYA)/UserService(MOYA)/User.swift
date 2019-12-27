//
//  User.swift
//  UserService(MOYA)
//
//  Created by Taewon Lee on 12/21/19.
//  Copyright © 2019 Taewon Lee. All rights reserved.
//

import Foundation

struct User: Decodable {
    var id: Int
    var name: String
    var email: String
}
