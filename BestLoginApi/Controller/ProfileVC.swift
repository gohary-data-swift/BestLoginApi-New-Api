//
//  ProfileVC.swift
//  NewSouq
//
//  Created by Ahmed Elgohary on 6/30/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController{
    
   
    
    @IBOutlet weak var mailText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var imageFromLibary: UIImageView!
    
    var getImagePiker = UIImage()
    var getName = ""
    var getMail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        imageFromLibary.image = getImagePiker
        mailText.text = getMail
        nameText.text = getName
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func AllOrderBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func editProfileBtnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "editProfileVC") as! editProfileVC
        self.navigationController?.pushViewController(DetVC, animated: true)
    }
    @IBAction func AllMyOrder(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        self.navigationController?.pushViewController(DetVC, animated: true)
    }
}

