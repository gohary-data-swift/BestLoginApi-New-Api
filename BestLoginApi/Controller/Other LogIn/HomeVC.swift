//
//  ViewController.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/8/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit
import SVProgressHUD
import SwiftMessages

class HomeVC: UIViewController {
    let reachability = Reachability()
    
    @IBOutlet var sign: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func signBtnClicked(_ sender: UIButton) {
        let tag = sender.tag
        for signBtn in sign {
            if signBtn.tag == tag {
                signBtn.backgroundColor = #colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 1)
                signBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            }else{
                signBtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                signBtn.setTitleColor(#colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 1), for: .normal)
                signBtn.borderColor = #colorLiteral(red: 0, green: 0.4784809947, blue: 0.9998757243, alpha: 1)
                signBtn.borderWidth = 1
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        do {
            try reachability?.startNotifier()
        } catch let error {
            print(error)
        }
        handleReachability()
    }
    fileprivate func handleReachability() {
        NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: reachability, queue: .main) { (notification) in
            if let MyRechability = notification.object as? Reachability {
                switch MyRechability.connection {
                case .cellular:
                    
                    self.displayMessage(message: "Connected by cellular data", messageError: false)
                case .wifi:
                    self.displayMessage(message: "Connected by Wifi", messageError: false)
                //displayToastMessage(Ar: "Connected by cellular data", En: "")
                case .none:
                    self.displayMessage(message: "No Internet Connection", messageError: true)
                }
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    func displayMessage(message: String, messageError: Bool) {
        
        let view = MessageView.viewFromNib(layout: MessageView.Layout.messageView)
        if messageError == true {
            view.configureTheme(.error)
        } else {
            view.configureTheme(.success)
        }
        
        view.iconImageView?.isHidden = true
        view.iconLabel?.isHidden = true
        view.titleLabel?.isHidden = true
        view.bodyLabel?.text = message
        view.titleLabel?.textColor = UIColor.white
        view.bodyLabel?.textColor = UIColor.white
        view.button?.isHidden = true
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        SwiftMessages.show(config: config, view: view)
    }
}

