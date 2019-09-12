//
//  displayToastMessage.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

func displayToastMessage(Ar Amessage : String , En Emessage : String) {
    
    let toastView = UILabel()
    toastView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    toastView.textColor = UIColor.white
    toastView.textAlignment = .center
    toastView.font = UIFont.preferredFont(forTextStyle: .headline)
    toastView.layer.cornerRadius = 25
    toastView.layer.masksToBounds = true
    
    if UserDefaults.standard.integer(forKey: "lang") == 1 {
        toastView.text = Emessage
    }else{
        toastView.text = Amessage
    }
    
    toastView.numberOfLines = 0
    toastView.alpha = 0
    toastView.translatesAutoresizingMaskIntoConstraints = false
    
    let window = UIApplication.shared.delegate?.window!
    window?.addSubview(toastView)
    
    let horizontalCenterContraint: NSLayoutConstraint = NSLayoutConstraint(item: toastView, attribute: .centerX, relatedBy: .equal, toItem: window, attribute: .centerX, multiplier: 1, constant: 0)
    
    let widthContraint: NSLayoutConstraint = NSLayoutConstraint(item: toastView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 275)
    
    let verticalContraint: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(>=200)-[loginView(==50)]-68-|", options: [.alignAllCenterX, .alignAllCenterY], metrics: nil, views: ["loginView": toastView])
    
    NSLayoutConstraint.activate([horizontalCenterContraint, widthContraint])
    NSLayoutConstraint.activate(verticalContraint)
    
    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
        toastView.alpha = 1
    }, completion: nil)
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            toastView.alpha = 0
        }, completion: { finished in
            toastView.removeFromSuperview()
        })
    })
}
