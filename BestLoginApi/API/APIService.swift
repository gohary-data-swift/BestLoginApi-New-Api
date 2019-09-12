//
//  PostsAPIService.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//


import Foundation
import Alamofire
import SVProgressHUD

class APIService {
    // singletone
    static let instance = APIService()
   // let params: [String : Any] = ["page" : 20]
    
    
    // API Get Function ===================>
    class func getAPI<T: Codable>(url: String, params: [String: Any]?, header: [String: String]?, completed: @escaping (_ status: Int, _ response: T?) -> Void){
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess{
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
                do{
                    guard let data = response.data else {return}
                    let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                    completed(1, jsonResponse)
                    
                }catch{
                    print(error)
                    completed(2, nil)
                }
            }else{
               // print("-------------->\(response.error!)")
                // if no conniction
                completed(3, nil)
            }
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
    }
    // <=================== API Get Function
    
    // API Post Function ===================>
    class func postAPI<T: Codable>(url: String, params: [String: Any]?, header: [String: String]?, completed: @escaping (_ status: Int, _ response: T?) -> Void){
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess{
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
                do{
                    guard let data = response.data else {return}
                    let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                  //  print("=-=-=-=-=- \(jsonResponse)" )
                    completed(1, jsonResponse)
                }catch{
                  //  print(error)
                    
                    completed(2, nil)
                }
            }else{
                print("-------------->\(response.error!)")
                completed(3, nil)
            }
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
            
        }
    }
    // <=================== API Post Function
     func getData<MyType: Decodable>(id: Int?, url: String, completion: @escaping (MyType?, Error?)->Void) {
        SVProgressHUD.show()
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { (response) in
            guard let data = response.data else { return }
            switch response.result {
            case .success(let val):
                print(val)
                do {
                    let Gets = try JSONDecoder().decode(MyType.self, from: data)
                    completion(Gets, nil)
                } catch let jsonError{

                    print(jsonError)
                }
                SVProgressHUD.dismiss()

            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
