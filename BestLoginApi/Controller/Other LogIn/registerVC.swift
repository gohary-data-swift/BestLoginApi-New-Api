//
//  registerVC.swift
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

class registerVC: UIViewController {
    
    @IBOutlet weak var PhoneNum: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var withKBConstrin: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func signupBtnClicked(_ sender: Any) {
        
        guard let name = nameTxt.text, !name.isEmpty else { return }
        guard let email = emailTxt.text, !email.isEmpty else { return }
        guard let password = passwordTxt.text, !password.isEmpty else  { return }
        guard let phoneNumber = PhoneNum.text, !phoneNumber.isEmpty else { return }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
}
