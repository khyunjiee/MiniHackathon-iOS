//
//  SignupService.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/26.
//  Copyright © 2019 김현지. All rights reserved.
//

import Foundation
import Alamofire

struct SignupService {
    static let signupShared = SignupService()
    
    func signup(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "userId": id,
            "password": pwd
        ]
        
        Alamofire.request(APIConstants.SignupURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(SignupResponseString.self, from: value)
                                    
                                    switch result.success {
                                    case true:
                                        print("success")
                                        completion(.success(result))
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.SignupURL)
                                }
                        case 400:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }//switch
                    }//iflet
                    break
                }
            case .failure:
                completion(.networkFail)
                break
            }
        }
    }
}
