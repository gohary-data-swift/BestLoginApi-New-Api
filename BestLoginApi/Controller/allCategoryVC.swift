//
//  allCategoryVC.swift
//  BestLoginApi
//
//  Created by Ahmed El-gohary on 7/28/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class allCategoryVC: UIViewController {
    

    @IBOutlet weak var allCategoryCollection: UICollectionView!
    @IBOutlet weak var allCategoryTable: UITableView!
    
    var getPopuler = [Category]()
    var getItems = [CategoryItems]()
    var emptyArr = [String]()
    var titleForTable = [tableTitle]()
    var getOneTiteOfCategory: CategoryItems?
    var params: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  title = "data"
        allCategoryTable.delegate = self
        allCategoryTable.dataSource = self
        allCategoryCollection.delegate = self
        allCategoryCollection.dataSource = self
        
        allCategoryTable.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        APIService.getAPI(url: "http://temp1.cloudtouch-test.com/api/categories", params: nil, header: nil) { (status, getAllNewPopuler: [Category]?) in
            if status == 1 {
                guard let responce = getAllNewPopuler else { return }
                self.getPopuler = responce
                self.allCategoryCollection.reloadData()
              //  print("success")
            }else if status == 2 {
              //  print("-=--error=---=")
            }else if status == 3 {
               // self.setEmptyMessage("🚫 Check Internet Connection")
            }
        }
        APIService.getAPI(url: "http://temp1.cloudtouch-test.com/api/categories?pId=8", params: nil, header: nil) { (status, getAllTitle: [tableTitle]?) in
            if status == 1 {
                guard let responce = getAllTitle else { return }
                self.titleForTable = responce
                self.allCategoryTable.reloadData()
              //  print("success")
            }else if status == 2 {
              //  print("-=--error=---=")
            }else if status == 3 {
                self.setEmptyMessage("🚫 Check Internet Connection")
            }
        }
        DispatchQueue.global(qos: .background).async {
            APIService.instance.getData(id: 202, url: URLs.clothes) { (categoryItems: [CategoryItems]?, error) in
                if error == nil {
                    self.getItems = categoryItems!
                    DispatchQueue.main.async {
                        self.allCategoryCollection.reloadData()
                    }
                }
            }
        }
    }
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: allCategoryCollection.bounds.size.width, height: allCategoryCollection.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .red
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 20)
        messageLabel.sizeToFit()
        allCategoryCollection.backgroundView = messageLabel;
    }
    
    @IBAction func exitBtnClicked(_ sender: Any) {
        
    }
}
extension allCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getPopuler.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AllCategoryCollectionCell
        
        let imageString = String(describing: getPopuler[indexPath.row].image)
        let url = URL(string: imageString)
        
        cell.imageCollection.kf.indicatorType = .activity
        cell.imageCollection.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
        
        cell.nameCollection.text = getPopuler[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let id = getPopuler[indexPath.row].id
        print("============\(id)")
        
        APIService.getAPI(url: "http://temp1.cloudtouch-test.com/api/categories?pId=\(id)", params: nil, header: nil) { (status, tableTitle: [tableTitle]?) in
            
            if status == 1 {
                guard let response = tableTitle else {return}
                self.titleForTable = response
                self.allCategoryTable.reloadData()
                //   print("success")
            }else if status == 2 {
                //   print("-=--=-=-=---=")
            }else if status == 3 {
                //   print("================")
            }
        }
    }
}
extension allCategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleForTable.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllCategoryTableCell
        let imageString = String(describing: titleForTable[indexPath.row].image ?? "")
        let url = URL(string: imageString)
        cell.textLbl.text = titleForTable[indexPath.row].name
        cell.imageCell.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "CategoryOf_ItemsVC") as! CategoryOf_ItemsVC
        DetVC.categoryID = self.titleForTable[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(DetVC, animated: true)
        
    }
    @IBAction func unwindSegeueVC(unwindSegeue: UIStoryboardSegue){
        self.tabBarController?.tabBar.isHidden = false
    }
}
