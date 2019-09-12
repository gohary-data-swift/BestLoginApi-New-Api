//
//  Cart+CoreDataProperties.swift
//  
//
//  Created by Ahmed El-gohary on 8/25/19.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var itemImage: NSData?
    @NSManaged public var itemPrice: Int32
    @NSManaged public var itemNumber: Int32
    @NSManaged public var totalPrice: Int32

}
