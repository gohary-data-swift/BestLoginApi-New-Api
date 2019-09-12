//
//  getAPIStruct.swift
//  BestLoginApi
//
//  Created by Ahmed Elgohary on 7/17/19.
//  Copyright © 2019 Ahmed Elgohary. All rights reserved.
//
// MARK: - CategoryElement
struct Category: Codable {
    let id: Int
    let name: String
    let is_active, include_in_menu, display_products, level: Int
    let sort_order: Int
    let created_at, updated_at: String
    let children_count: Int
    let image: String
}
// MARK: - Banner
struct Banners: Codable {
    let id: Int
    let image: String
    let type: String
    let category_id: Int?
    let url: String
    let position: Int
}
// MARK: - Product
struct mProduct: Codable {
    let id, seller_id: Int
    let sku, url: String
    let brand_id: Int
    let feature_set_id, checkav, position, is_featured: Int
    let views: Int
    let created_at, updated_at, title, product_description: String
    let short_description: String
    let is_available, old_price, current_price, stock: Int
    let main_image, images: [Image]
}

// MARK: - Image
struct Image: Codable {
    let id, product_id: Int
    let image: String
    let status: Int
    let created_at, updated_at: String
}
// MARK: - Brand
struct Brand: Codable {
    let id: Int
    let name: String
    let is_active, is_listed: Int
    let created_at, updated_at: String
    let image: String
}
struct CategoryItems: Codable {
    let id, seller_id: Int?
    let sku, url: String?
    let brand_id: Int?
    let feature_set_id, checkav, position, is_featured: Int?
    let views: Int?
    let created_at, updated_at, title, login_model_description: String?
    let short_description: String?
    let is_available, old_price, current_price, stock: Int?
    let main_image, images: [ImageClass]?
    

}
// MARK: - Image
struct ImageClass: Codable {
    let id, product_iD: Int?
    let image: String?
    let status: Int?
    let created_at, updated_at: String?

}

