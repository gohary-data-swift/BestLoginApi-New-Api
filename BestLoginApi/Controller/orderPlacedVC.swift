//
//  orderPlacedVC.swift
//  BestLoginApi
//
//  Created by Ahmed El-gohary on 9/5/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class orderPlacedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        

        // Do any additional setup after loading the view.
    }
    @IBAction func orderPlacedBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.pushViewController(DetVC, animated: true)
        
    }
}
