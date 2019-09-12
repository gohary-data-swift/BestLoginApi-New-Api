//
//  helper.swift
//  NewTestAPI
//
//  Created by Ahmed Elgohary on 7/6/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

let Udef = UserDefaults.standard

class Helper {
    

    class func restartApp()  {
        
         guard let window = UIApplication.shared.keyWindow else { return }

        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController

        if getApiToken() == nil {
            vc = sb.instantiateInitialViewController()!
        }else {
            vc = sb.instantiateViewController(withIdentifier: "tabMain")
        }

        window.rootViewController = vc
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
        
    }
    
    class func saveApiToken(token: String){
        Udef.setValue(token, forKey: "api_token")
        Udef.synchronize()
        restartApp()
    }
    

    class func getApiToken() -> String? {
        return Udef.object(forKey: "api_token") as? String
    }
}

