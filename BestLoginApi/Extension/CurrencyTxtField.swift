//
//  CurrencyTxtField.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyTxtField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let imageAlert = #imageLiteral(resourceName: "search")
        let imageViewTitle = UIImageView(frame: CGRect(x: 55, y: (frame.size.height / 2) - size / 2, width: size, height: size))
        imageViewTitle.image = imageAlert
                addSubview(imageViewTitle)
    }
    override func prepareForInterfaceBuilder(){
        customizeView()
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        customizeView()
    }
    func customizeView(){
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.cornerRadius = 20
        textAlignment = .center
        clipsToBounds = true
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor:#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 0.9598268867, green: 0.9648519158, blue: 0.9732733369, alpha: 1)
        }
    }
}
