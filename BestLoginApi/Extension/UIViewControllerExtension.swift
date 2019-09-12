//
//  UIViewControllerExtension.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/9/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//بيعمل سيجواي بين الصفحات بدون روابط
 

import UIKit

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent : UIViewController)  {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition , forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController)  {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        
        guard let presentedViewController = presentedViewController else { return }
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    
    func dismissDetail()  {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition , forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    /*
     
     داخل الزرار اللي عاوزه يعمل السيجواي بعمل التالي
     بس لازم اكون عامل ايدينتيفاير للفيو اللي انا عاوز انتقل ليه
     
     @IBAction func button_AddGoal(_ sender: UIButton) {
     
     guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "creatGoalVC") else { return }
     
     presentDetail(createGoalVC)
     }
     */
    
    
}
