//
//  AllYourFashionVC.swift
//  BestLoginApi
//
//  Created by Ahmed El-gohary on 8/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class AllYourFashionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }
    
    @IBOutlet var homeBtn: [UIButton]!
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var viewProducts: UIView!
    @IBOutlet weak var viewReviews: UIView!
    
    // Mark:- Outlet CollectionViews
    @IBOutlet weak var shirtsCollection: UICollectionView!
    @IBOutlet weak var pantsCollection: UICollectionView!
    @IBOutlet weak var bagsCollection: UICollectionView!
    @IBOutlet weak var mobileCollection: UICollectionView!
    
    // Mark:- Virable API
    var getItems = [CategoryByID]()
    var categoryID: Int?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        viewHome.isHidden = true
        viewReviews.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.global(qos: .background).async {
            APIService.getAPI(url: "http://temp1.cloudtouch-test.com/api/products/category/\(self.categoryID ?? 0)", params: nil, header: nil, completed: { (status, categoryByID: [CategoryByID]?) in
                
                if status == 1 {
                    guard let response = categoryByID else { return }
                    self.getItems = response
                    self.shirtsCollection.reloadData()
                  //  print("=============> \(response)")
                }else if status == 2 {
                    
                }else {
                }
            })
        }
    }
    @IBAction func backBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.shirtsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! itemesCell
              ///////////////////

            return cell
        }else if collectionView == self.shirtsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! itemesCell
            
            return cell
        }else if collectionView == self.shirtsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! itemesCell
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! itemesCell
            
            return cell
        }
    }
    @IBAction func homeBtnClicked(_ sender: UIButton) {
        let tag = sender.tag
        for button in homeBtn {
            if button.tag == tag {
                button.setTitleColor(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1), for: .normal)
            }else{
                button.setTitleColor(#colorLiteral(red: 0.2905786335, green: 0.3097752929, blue: 0.3390932381, alpha: 1), for: .normal)
            }
        }
        viewHome.isHidden = false
        viewReviews.isHidden = true
        viewProducts.isHidden = true
    }
    @IBAction func productsBtnClicked(_ sender: UIButton) {
        viewHome.isHidden = true
        viewReviews.isHidden = true
        viewProducts.isHidden = false
        let tag = sender.tag
        for button in homeBtn {
            if button.tag == tag {
                button.setTitleColor(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1), for: .normal)
            }else{
                button.setTitleColor(#colorLiteral(red: 0.2905786335, green: 0.3097752929, blue: 0.3390932381, alpha: 1), for: .normal)
            }
        }
    }
    @IBAction func reviewsBtnClicked(_ sender: UIButton) {
        viewHome.isHidden = true
        viewReviews.isHidden = false
        viewProducts.isHidden = true
        let tag = sender.tag
        for button in homeBtn {
            if button.tag == tag {
                button.setTitleColor(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1), for: .normal)
            }else{
                button.setTitleColor(#colorLiteral(red: 0.2905786335, green: 0.3097752929, blue: 0.3390932381, alpha: 1), for: .normal)
            }
        }
    }
    
    
}
