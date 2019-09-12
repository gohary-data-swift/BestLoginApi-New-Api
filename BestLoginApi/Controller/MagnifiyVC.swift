//
//  MagnifiyVC.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/16/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class MagnifiyVC: UIViewController {
    
    private var magnifyView: MagnifyView?
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var nameItem: UILabel!
    var getImage = UIImage()
    var getName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageItem.image = getImage
        nameItem.text = getName
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        if magnifyView == nil
        {
            magnifyView = MagnifyView.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            magnifyView?.viewToMagnify = self.view
            magnifyView?.setTouchPoint(pt: point!)
            self.view.addSubview(magnifyView!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if magnifyView != nil
        {
            magnifyView?.removeFromSuperview()
            magnifyView = nil
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        magnifyView?.setTouchPoint(pt: point!)
        magnifyView?.setNeedsDisplay()
    }
}
