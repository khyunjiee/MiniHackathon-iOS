//
//  LoginService.swift
//  Sockttery
//
//  Created by 최은지 on 26/11/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation
import Alamofire

class LoginService {
    
    static let loginShared = LoginService()
    
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "userId": id,
            "password": pwd
        ]
        
        // 서버로 request 전송 - http 비동기 통신 라이브러리 : 함수가 호출된 순차적으로 진행됨
        Alamofire.request(APIConstants.LoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in // response 에 결과값 저장 -> print 해보기
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    print("통신 성공")
                    
//                    if let value = response.response?.statusCode
                    
                    
                    
                // 네트워크 통신 실패
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                    
                }
        }
    }
    
}




