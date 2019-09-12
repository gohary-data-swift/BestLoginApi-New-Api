//
//  loginVC.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/8/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON
import SwiftMessages

class loginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var passwordTXT: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var withKBConstrin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
  
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func signinBtnClecked(_ sender: Any) {
        guard let email = emailTxt.text, !email.isEmpty else { return }
        guard let password = passwordTXT.text, !password.isEmpty else  { return }

        let params = Params.loginParams(user_name: email, password: password)
        
        APIService.postAPI(url: URLs.login, params: params, header: nil) { (status, loginMode: LoginModel?) in
            if status == 1 {
                guard let response = loginMode else { return }
                
                if response.status == 1 {
                    print("Successfull Login")
                    print("===========> api_token = \(response.apiToken)")
                    
                }else {
                    print("wrong username or password")
                }
            }else if status == 2 {
                print("there is some problem")
            }else if status == 3 {
                print("there is some problem in internet connection")
            }        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
}
