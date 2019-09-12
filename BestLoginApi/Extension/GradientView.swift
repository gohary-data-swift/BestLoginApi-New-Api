//
//  GradientView.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var frist: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1){
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var Second: UIColor = #colorLiteral(red: 0.8739974499, green: 0.8880397677, blue: 0.8971714377, alpha: 1){
        didSet {
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [frist.cgColor, Second.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
 
}
