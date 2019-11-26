//
//  MypageService.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/27.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation
import Alamofire

struct MypageService {
    static let shared = MypageService()
    
    func mypage(_ userId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        Alamofire.request(APIConstants.MypageURL + userId, method: .get, encoding: JSONEncoding.default).responseData { response in
            
            
            
        }
    }
}
