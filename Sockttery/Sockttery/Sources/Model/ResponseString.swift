//
//  ResponseString.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/26.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation

struct ResponseString: Codable {
    let status: Int
    let message: String
    let data: Int
}
