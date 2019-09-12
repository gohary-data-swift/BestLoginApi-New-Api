//
//  API.swift
//  NewTestAPI
//
//  Created by Ahmed Elgohary on 7/6/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import SVProgressHUD
import Kingfisher

class API: NSObject {
    
 
    // API Post Function ===================>
//    class func loginPost(email: String, password: String, completed: @escaping (_ response: ResponseAuth) -> Void){
//
//        let url = URLs.login
//
//        let params = ["user_name":email,
//                      "password":password]
//
//        let header = ["Content-Type":"application/json"]
//
//        //SVProgressHUD.show()
//        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
//            if response.result.isSuccess{
//                //SVProgressHUD.dismiss()
//                DispatchQueue.main.async {
//                    do{
//                        //guard let data = response.data else {return}
//                        let jsonResponse = try JSONDecoder().decode(ResponseAuth.self, from: response.data!)
//
//                        //print("===========>\(jsonResponse)")
//                        completed(jsonResponse)
//                    }catch{
//
//                        print("-----------")
//                        print(error)
//                    }
//                }
//            }else{ // no connection
//                print("+++++++++")
//                print(response.error!)
//            }
//            //SVProgressHUD.dismiss()
//        }
//    }
    
    
    
    // API Post Function ===================>
//    class func registerPost(name: String,email: String, password: String,phone_number: String, completed: @escaping (_ response: ResponseAuth) -> Void){
//
//        let url = URLs.register
//
//        let params = ["name":name,
//                      "email":email,
//                      "password":password,
//                      "password_confirmation": phone_number]
//
//        let header = ["Content-Type":"application/json"]
//
//        SVProgressHUD.show()
//
//        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
//            if response.result.isSuccess{
//                SVProgressHUD.dismiss()
//                DispatchQueue.main.async {
//                    do{
//                        //guard let data = response.data else {return}
//                        let jsonResponse = try JSONDecoder().decode(ResponseAuth.self, from: response.data!)
//                        completed(jsonResponse)
//                    }catch{
//                        print(error)
//                    }
//                }
//            }else{
//                print(response.error!)
//            }
//            SVProgressHUD.dismiss()
//        }
//    }
}
