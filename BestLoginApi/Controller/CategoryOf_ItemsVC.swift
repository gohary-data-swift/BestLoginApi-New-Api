//
//  CategoryOf_ItemsVC.swift
//  BestLoginApi
//
//  Created by Ahmed El-gohary on 7/31/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class CategoryOf_ItemsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var filterConstren: NSLayoutConstraint!
    @IBOutlet weak var barkView: UIView!
    @IBOutlet weak var CollectionItemCollection: UICollectionView!
    @IBOutlet weak var searchControl: UISearchBar!
    @IBOutlet weak var filterBtn: UIButton!
    
    var getItems = [CategoryByID]()
    var currentCategory = [CategoryByID]()
    var refresherControl = UIRefreshControl()
    var categoryID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionItemCollection.delegate = self
        CollectionItemCollection.dataSource = self
        searchControl.delegate = self
        Delegat_refreshing()  
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.global(qos: .background).async {
            
            APIService.getAPI(url: "http://temp1.cloudtouch-test.com/api/products/category/\(self.categoryID ?? 0)", params: nil, header: nil, completed: { (status, categoryByID: [CategoryByID]?) in
                
                if status == 1 {
                    guard let response = categoryByID else { return }
                    self.getItems = response
                    self.CollectionItemCollection.reloadData()
                 //   print("=============> \(response)")
                }else if status == 2 {
                    
                }else {
                }
            })
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryOf_ItemsCell
        
        let imageString = String(describing: getItems[indexPath.row].mainImage?[0].image ?? "")
        let url = URL(string: imageString)
        
        cell.nameItem.text = getItems[indexPath.row].title ?? ""
        cell.imageItem.kf.indicatorType = .activity
        cell.imageItem.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
        cell.priceItem.text = "\(getItems[indexPath.row].currentPrice ?? 0)"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "DetailsItemVC") as! DetailsItemVC
        DetVC.getBestCategory = getItems[indexPath.row]
        self.navigationController?.pushViewController(DetVC, animated: true)
    }
    
    // SearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            APIService.getAPI(url: "http://temp1.cloudtouch-test.com/api/products/category/\(self.categoryID ?? 0)", params: nil, header: nil, completed: { (status, categoryByID: [CategoryByID]?) in
                
                if status == 1 {
                    guard let response = categoryByID else { return }
                    self.getItems = response
                    self.CollectionItemCollection.reloadData()
                }
                
                self.view.endEditing(true)
            })
            return
        }
        
        getItems = getItems.filter({ (ccategory) -> Bool in
            ccategory.title!.lowercased().contains(searchText.lowercased())
        })
        self.CollectionItemCollection.reloadData()
        ////////end of search delegate
    }
    @objc func refresh(){
        CollectionItemCollection.reloadData()
        refresherControl.endRefreshing()
    }
    func Delegat_refreshing() {
        CollectionItemCollection.delegate = self
        CollectionItemCollection.dataSource = self
        searchControl.delegate = self
        CollectionItemCollection.reloadData()
        refresherControl.attributedTitle = NSAttributedString(string: "Refreshing....")
        refresherControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        CollectionItemCollection.addSubview(refresherControl)
    }
    @IBAction func applyFilterBtn(_ sender: Any) {
        filterConstren.constant = -270
        filterBtn.tintColor = UIColor.black
        barkView.isHidden = true
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func filterBtnClicked(_ sender: UIButton) {
        
        if sender.tintColor == UIColor.black {
            sender.tintColor = UIColor.red
            filterConstren.constant = 0
            barkView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
        }else{
            filterConstren.constant = -270
            barkView.isHidden = true
            sender.tintColor = UIColor.black
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
