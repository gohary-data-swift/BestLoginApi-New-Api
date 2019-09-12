//
//  DetailsItemVC.swift
//  NewSouq
//
//  Created by Ahmed Elgohary on 7/2/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData
import AVFoundation

class DetailsItemVC: UIViewController {
    
    var getImage = UIImage()
    var getName = ""
    var getOneCategory: Brand?
    var getBestCategory: CategoryByID?
    var getItems = [CategoryByID]()
    
    var audioPlayer: AVAudioPlayer!
     
    private var magnifyView: MagnifyView?
    
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet var shareBtn: [UIButton]!
    @IBOutlet var sizeBtn: [UIButton]!
    @IBOutlet var colorBtn: [UIButton]!
    @IBOutlet var ProductsBtn: [UIButton]!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var fullItemName: UILabel!
    @IBOutlet weak var size_colorView: UIView!
    @IBOutlet weak var addCartConstrin: NSLayoutConstraint!
     // Mark: - Cosmos Outlet
    @IBOutlet var cosmosViewFull: CosmosView!
    @IBOutlet var ratingSlider: UISlider!
    @IBOutlet var ratingLabel: UILabel!
    private let startRating:Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cosmosViewFull.didTouchCosmos = didTouchCosmos
        cosmosViewFull.didFinishTouchingCosmos = didFinishTouchingCosmos
        ratingSlider.value = Float(Double(startRating)) //3.7 slider
        updateRating()
      //  size_colorView.isHidden = true
  
        let imageString = String(describing: getOneCategory?.image ?? "")
        let url = URL(string: imageString)
        
     // Mark: - Home Items Details
        imageItem.kf.indicatorType = .activity
        imageItem.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.transition(.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
        fullItemName.text = getOneCategory?.name
       
        
       // Mark: - All Category Details
        let imageString2 = String(describing: getBestCategory?.mainImage?[0].image ?? "")
        let url1 = URL(string: imageString2)
        imageItem.kf.indicatorType = .activity
        imageItem.kf.setImage(with: url1, placeholder: UIImage(named: "placeholder"), options: [.transition(.flipFromTop(0.5))], progressBlock: nil, completionHandler: nil)
        fullItemName.text = getBestCategory?.title
        currentPrice.text = "$\(getBestCategory?.currentPrice ?? 0)"
        oldPrice.text = "$\(getBestCategory?.oldPrice ?? 0)"
    }
    private func updateRating() {
        let value = Double(ratingSlider.value)
        cosmosViewFull.rating = value
        
        self.ratingLabel.text = "⭐️\(DetailsItemVC.formatValue(value))"
    }
    @IBAction func onSliderChanged(_ sender: UISlider) {
        updateRating()
    }
    private class func formatValue(_ value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
    private func didTouchCosmos(_ rating: Double) {
        ratingSlider.value = Float(Double(rating))
        ratingLabel.text = "⭐️\(DetailsItemVC.formatValue(rating))"
        ratingLabel.textColor = .white
    }
    
    private func didFinishTouchingCosmos(_ rating: Double) {
        ratingSlider.value = Float(rating)
        self.ratingLabel.text = "⭐️\(DetailsItemVC.formatValue(rating))"
        ratingLabel.textColor = .white
    }
    
    @IBAction func shareBtnClicked(_ sender: UIButton) {
        let tag = sender.tag
        for share in shareBtn {
            if share.tag == tag {
                share.setTitleColor(#colorLiteral(red: 0.9998950362, green: 1, blue: 0.999871552, alpha: 1), for: .normal)
                share.backgroundColor = #colorLiteral(red: 0.9192582965, green: 0.2425331175, blue: 0.1937060654, alpha: 0.7959385702)
                share.cornerRadius = 17.5
                share.shadowRadius = 3
                share.shadowOpacity = 2
                share.shadowOffset = CGSize(width: 2, height: 2)
                share.shadowColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)

                self.saveContext { (complet) in
                    if complet{
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let DetVC = storyboard.instantiateViewController(withIdentifier: "orderPlacedVC") as! orderPlacedVC
                        self.navigationController?.pushViewController(DetVC, animated: true)
                        playTone()
                    }
                }
                
            }else{
                share.setTitleColor(#colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), for: .normal)
                share.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.999871552, alpha: 1)
                share.shadowColor = .clear
            }
        }
    }
    @IBAction func showZooming(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetVC = storyboard.instantiateViewController(withIdentifier: "MagnifiyVC") as! MagnifiyVC
         DetVC.getImage = imageItem.image!
         DetVC.getName = fullItemName.text!
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.pushViewController(DetVC, animated: true)
    }
    
    // Mark:- Save to Coredata
    
    func saveContext(completion: (_ finished: Bool) ->()){
     
        let cart = Cart(context: context)
        cart.itemImage = imageItem.image
        cart.itemName = String(describing: fullItemName.text)
       
       // cart.itemPrice = Int32(currentPrice.text!)!
       // cart.itemNumber = Int32(oldPrice.text!)!
        do {
            try context.save()
            completion(true)
            print("Succesfully Save data.")
        }catch{
            debugPrint("Cann't Save : \(error.localizedDescription)")
            completion(false)
        }
    }
    
    @IBAction func sizeBtnClicked(_ sender: UIButton) {
        let tag = sender.tag
        for size in sizeBtn {
            if size.tag == tag {
                size.setTitleColor(#colorLiteral(red: 0.8811435103, green: 0.2351437211, blue: 0.1819779277, alpha: 0.7636183647), for: .normal)
                size.shadowRadius = 3
                size.shadowOpacity = 2
                size.shadowOffset = CGSize(width: 2, height: 2)
                size.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }else{
                size.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
                size.shadowColor = .clear
            }
        }
    }
    @IBAction func productsBtnClicked(_ sender: UIButton) {
        productsView(sender)
    }
    @IBAction func colorBtnClicked(_ sender: UIButton) {
        let tag = sender.tag
        for color in colorBtn {
            if color.tag == tag {
                color.cornerRadius = 25
                color.shadowRadius = 7
                color.shadowOpacity = 2
                color.shadowOffset = CGSize(width: 2, height: 2)
                color.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }else{
                color.shadowColor = .clear
            }
        }
    }
    func productsView(_ sender: UIButton) {
        let tag = sender.tag
        for products in ProductsBtn {
            if products.tag == tag {
                products.setTitleColor(#colorLiteral(red: 0.8811435103, green: 0.2351437211, blue: 0.1819779277, alpha: 0.7636183647), for: .normal)
                products.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                products.shadowRadius = 3
                products.shadowOpacity = 2
                products.shadowOffset = CGSize(width: 2, height: 2)
                products.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                if products.tag == 2 {
                    
                    UIView.animate(withDuration: 0.4 ) {
                        self.view.layoutIfNeeded()
                        
                    }
                }else if products.tag == 0 {
                    
                    UIView.animate(withDuration: 0.4 ) {
                        self.view.layoutIfNeeded()
                    }
                }
            }else{
                products.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
                products.backgroundColor = .clear
                products.shadowColor = .clear

            }
        }
    }
   func playTone() {
           
           let path = Bundle.main.path(forResource: "not-bad", ofType: "mp3")
           let url = URL(fileURLWithPath: path!)
           do {
               audioPlayer = try AVAudioPlayer(contentsOf: url)
               audioPlayer.prepareToPlay()
           } catch let error as NSError {
               print(error.description)
           }
           
           audioPlayer.play()
       }
}
