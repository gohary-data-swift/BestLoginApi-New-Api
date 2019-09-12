// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let order = try? newJSONDecoder().decode(Order.self, from: jsonData)

import Foundation

// MARK: - OrderElement
struct OrderElement: Codable {
    let id, userID, count, price: Int?
    let discount, amount, status: Int?
    let createdAt, updatedAt: String?
    let products: [Product]?
    let shipping: Shipping?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case count, price, discount, amount, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case products, shipping
    }
}

// MARK: - Product
struct Product: Codable {
    let id, orderID, productID, quantity: Int?
    let price, discount, amount, isReceivable: Int?
    let createdAt, updatedAt: String?
    let name: Name?
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case productID = "product_id"
        case quantity, price, discount, amount
        case isReceivable = "is_receivable"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
    }
}

enum Name: String, Codable {
    case منتجمحذوف = "منتج محذوف"
}

// MARK: - Shipping
struct Shipping: Codable {
    let id, orderID: Int?
    let name: String?
    let countryID, regionID: Int?
    let city: String?
    let zipCode: Int?
    let phoneNumber, address: String?
    let status: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case name
        case countryID = "country_id"
        case regionID = "region_id"
        case city
        case zipCode = "zip_code"
        case phoneNumber = "phone_number"
        case address, status
    }
}

typealias Order = [OrderElement]

