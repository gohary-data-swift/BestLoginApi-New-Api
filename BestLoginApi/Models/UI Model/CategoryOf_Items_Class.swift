//
//  CategoryOf_Items_Class.swift
//  BestLoginApi
//
//  Created by Ahmed El-gohary on 7/31/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//

import UIKit

class CategoryOf_ItemsClass {
    var imageOfItems: UIImage!
    var nameOfItems: String!
    var priceOfItems: String!
    
    init(imageOfItems: UIImage, nameOfItemes: String, priceOfItems: String) {
        self.imageOfItems = imageOfItems
        self.nameOfItems = nameOfItemes
        self.priceOfItems = priceOfItems
    }
}
