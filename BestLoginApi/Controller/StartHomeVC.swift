//
//  StartHomeVC.swift
//  BestLoginApi
//
//  Created by Ahmed El-gohary on 8/5/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit
import SwiftMessages

class StartHomeVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }
    
    // Mark:- Outlet Change lognView
    @IBOutlet var signBtn: [UIButton]!
    @IBOutlet var selectType: [UIButton]!
    @IBOutlet var typeName: [UILabel]!
    @IBOutlet weak var signUpStack: UIView!
    @IBOutlet weak var logInStack: UIView!
    @IBOutlet weak var policyStack: UIStackView!
    @IBOutlet weak var forGotPassStack: UIView!
    
    // Mark:- Outlet SignIn View
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneNumTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    // Mark:- Outlet LogIn View
    @IBOutlet weak var emailLogIn: UITextField!
    @IBOutlet weak var nameLogIn: UITextField!
    @IBOutlet weak var passwordLogIn: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInBtnClicked(_ sender: UIButton) {
        changeBtnColor(sender)
        signUpStack.isHidden = false
        policyStack.isHidden = false
        logInStack.isHidden = true
        forGotPassStack.isHidden = true
        
    }
    @IBAction func logInBtnClicked(_ sender: UIButton) {
        changeBtnColor(sender)
        signUpStack.isHidden = true
        policyStack.isHidden = true
        logInStack.isHidden = false
        forGotPassStack.isHidden = true
        
    }
    @IBAction func forGotPassBtnClicked(_ sender: UIButton) {
        changeBtnColor(sender)
        signUpStack.isHidden = true
        policyStack.isHidden = true
        logInStack.isHidden = true
        forGotPassStack.isHidden = false
    }
    func changeBtnColor(_ sender: UIButton) {
        let tag = sender.tag
        for sign in signBtn {
            if sign.tag == tag {
                sign.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            }else{
                sign.setTitleColor(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1), for: .normal)
            }
        }
    }
    func changeTypeColor(_ sender: UIButton) {
        
        let tag = sender.tag
        for type in selectType {
            if type.tag == tag {
                type.tintColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
                
            }else{
                type.tintColor = #colorLiteral(red: 0.7856380343, green: 0.7857710123, blue: 0.7856205106, alpha: 1)
            }
        }
        let tagNum = sender.tag
        for typeName in typeName {
            if typeName.tag == tagNum {
                typeName.textColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
                
            }else{
                typeName.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            }
        }
    }
    
    @IBAction func sellerBtnClicked(_ sender: UIButton) {
        changeTypeColor(sender)
    }
    
    @IBAction func clientBtnClicked(_ sender: UIButton) {
        changeTypeColor(sender)
    }
    @IBAction func signUpBtnClicked(_ sender: Any) {
        
        guard let email = emailTxt.text, !email.isEmpty else { return }
        guard let password = passwordTxt.text, !password.isEmpty else  { return }
        guard let name = nameTxt.text, !name.isEmpty else { return }
        guard let phone = phoneNumTxt.text, !phone.isEmpty else  { return }
        let type = "Seller"
        
        let parms = Params.registerParams(email: email, phone_number: phone, name: name, type: type, password: password)
        APIService.postAPI(url: URLs.register, params: parms, header: nil) { (status, registerModel: RegisterModel?) in
            if status == 1  {
                guard let response = registerModel else { return }
                if response.status == 1 {
                    if let API_TOKEN = registerModel?.apiToken {
                        Helper.saveApiToken(token: API_TOKEN)
                        
                        print("------------------> API Token \(API_TOKEN)")
                    }
                   print("register succefully")
                }else {
                    print("wrong username or password")
                }
            }else if status == 2 {
               print("there is some problem")
            }else if status == 3 {
               print("there is some problem in internet connection")
            }
        }
    }
    @IBAction func LogInBtnClicked(_ sender: Any) {
        
    //guard let email = emailLogIn.text, !email.isEmpty else { return }
        guard let password = passwordLogIn.text, !password.isEmpty else  { return }
        guard let name = nameLogIn.text, !name.isEmpty else { return }
        
        let params = Params.loginParams(user_name: name, password: password)
        APIService.postAPI(url: URLs.login, params: params, header: nil) { (status, logInModel: LoginModel?) in
            if status == 1 {
                guard let response = logInModel else { return }
                if response.status == 1 {
                    if let API_TOKEN = logInModel?.apiToken {
                        Helper.saveApiToken(token: API_TOKEN)
                        print("------------------> API Token \(API_TOKEN)")
                    }
                    print("Log in succefully")
                }else {
                   print("wrong username or password")
                }
            }else if status == 2 {
               print("there is some problem")
            }else if status == 3 {
                print("there is some problem in internet connection")
            }
        }
    }
}

