//
//  CurrencyTxtField.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

//@IBDesignable
class CustmButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        
        let imageAlert = #imageLiteral(resourceName: "OrderPlaced")
        let imageViewTitle = UIImageView(frame: CGRect(x: 125, y: 8, width: 20, height: 20))
        imageViewTitle.image = imageAlert
        addSubview(imageViewTitle)
      
    }
}
