//
//  Params.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/6/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import Foundation

class Params {

    
    class func registerParams(email: String, phone_number: String, name: String, type: String?, password: String) -> [String: Any] {
        let params = ["email" : email,
                      "phone_number" : phone_number,
                      "name" : name,
                      "type" : type,
                      "password" : password]
        return params as [String : Any]
    }
    
    
    class func loginParams(user_name: String, password: String) -> [String: Any] {
        let params = ["user_name" : user_name,
                      "password" : password,
        ]
        return params
    }

    static let header = ["Content-Type":"application/json"]
}
