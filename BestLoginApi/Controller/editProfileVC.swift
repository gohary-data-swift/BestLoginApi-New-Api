//
//  editProfileVC.swift
//  BestLoginApi
//
//  Created by Ahmed El-gohary on 7/29/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class editProfileVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    @IBOutlet weak var mailEditText: UITextField!
    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var imageFromLibary: UIImageView!
    var imagePiker = UIImagePickerController()
    var getImage = UIImage()
    var getNameEdit = ""
    var getMailEdit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        imagePiker.delegate = self
        imagePiker.sourceType = .photoLibrary
        imageFromLibary.image = getImage
        
        nameEditText.text = getNameEdit
        mailEditText.text = getMailEdit
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageFromLibary.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage

        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        getImage = image!
        self.imagePiker.dismiss(animated: true, completion: nil)
    }
    @IBAction func EditPhoto(_ sender: Any) {
        
        present(imagePiker, animated: true, completion: nil)
 
    }
    @IBAction func SaveBtnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        DetVC.getImagePiker = getImage
        DetVC.getMail = getMailEdit
        DetVC.getName = getNameEdit
        self.navigationController?.pushViewController(DetVC, animated: true)
    }
}
