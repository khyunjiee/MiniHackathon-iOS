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
        
        // Alamofire는 비동기 방식이기 때문에 response가 오기 전에 함수를 실행함.
        // 따라서 completion 핸들러를 escaping closure로 작성해 login 함수가 모두 반환된 후
        // 즉 response가 서버로부터 응답이온 후에 실행이 되도록 한다.
        Alamofire.request(APIConstants.LoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                //                print("request", response.request)
                //                print("response", response.response)
                //                print("data", response.data)
                //                print("result", response.result)
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(LoginResponseString.self, from: value)
                                    
                                    completion(.success(result.message))
                                }
                                catch {
                                    print("경로가 잘못되었습니다.")
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.LoginURL)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }// switch
                        }// iflet
                    }
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    // .networkFail이라는 반환값이 넘어감
                    break
                }
        }
    }
    
}




