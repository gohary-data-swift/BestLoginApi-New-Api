//
//  CategoriesVC.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    
    @IBOutlet weak var CategoryCollection: UICollectionView!
    
    var getCategory = [Category]()
    var titleForTable = [tableTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        APIService.getAPI(url: "http://temp1.cloudtouch-test.com/api/categories", params: nil, header: nil, completed: { (status, getAllCategory: [Category]?) in
                if status == 1 {
                    guard let response = getAllCategory else { return }
                    self.getCategory = response
                    self.CategoryCollection.reloadData()
                  //  print("success")
                }else if status == 2 {
                   // print("-=--=-=-=---=")
                }else if status == 3 {
                //self.setEmptyMessage("🚫 Check Internet Connection")
                }
            })
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getCategory.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCell
 
        let imageString = String(describing: getCategory[indexPath.row].image)
        let url = URL(string: imageString)
        
        cell.imageView.kf.indicatorType = .activity
        cell.imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
        cell.textNameLbl.text = getCategory[indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "AllYourFashionVC") as! AllYourFashionVC
       // DetVC.categoryID = self.titleForTable[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(DetVC, animated: true)
        
    }
    @IBAction func allItemsBtnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "allCategoryVC") as! allCategoryVC
        self.navigationController?.pushViewController(DetVC, animated: true)
    }
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: CategoryCollection.bounds.size.width, height: CategoryCollection.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .red
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 20)
        messageLabel.sizeToFit()
        CategoryCollection.backgroundView = messageLabel;
        
    }
}
