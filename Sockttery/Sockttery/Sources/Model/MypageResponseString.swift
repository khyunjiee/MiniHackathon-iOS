//
//  MypageResponseString.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/27.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation

struct MypageResponseString: Codable {
    let success: Bool
    let message: String
    let data: DataClass?
}

struct DataClass: Codable {
    let userIdx, pay: Int
    let userId, password, money: String
}
