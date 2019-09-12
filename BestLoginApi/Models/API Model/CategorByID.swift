// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoryByID = try? newJSONDecoder().decode(CategoryByID.self, from: jsonData)

import Foundation

// MARK: - CategoryByIDElement
struct CategoryByID: Codable {
    let id, sellerID: Int?
    let parentID: Int?
    let sku, url: String?
    let brandID: Int?
    let type: String?
    let featureSetID, checkav, position, isFeatured: Int?
    let views: Int?
    let createdAt, updatedAt, title, categoryByIDDescription: String?
    let shortDescription: String?
    let isAvailable, oldPrice, currentPrice, stock: Int?
    let featureValues: [FeatureValue]?
    let mainImage, images: [Image]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sellerID = "seller_id"
        case parentID = "parent_id"
        case sku, url
        case brandID = "brand_id"
        case type
        case featureSetID = "feature_set_id"
        case checkav, position
        case isFeatured = "is_featured"
        case views
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case title
        case categoryByIDDescription = "description"
        case shortDescription = "short_description"
        case isAvailable = "is_available"
        case oldPrice = "old_price"
        case currentPrice = "current_price"
        case stock
        case featureValues = "feature_values"
        case mainImage = "main_image"
        case images
    }
}

// MARK: - FeatureValue
struct FeatureValue: Codable {
    let id, productID, featureID: Int?
    let value, createdAt, updatedAt: String?
    let featureName: FeatureName?
    let valueName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case featureID = "feature_id"
        case value
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case featureName = "feature_name"
        case valueName = "value_name"
    }
}

enum FeatureName: String, Codable {
    case color = "Color"
    case rate = "Rate"
    case size = "Size"
}

// MARK: - Image
struct Imagey: Codable {
    let id, productID: Int?
    let image: String?
    let status: Int?
    let createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case image, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}



