// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? newJSONDecoder().decode(LoginModel.self, from: jsonData)

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let status: Int?
    let apiToken: String?
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case status
        case apiToken = "api_token"
        case user
    }
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let name, email, city, address: String?
    let phoneNumber: String?
    let shippingAddress: JSONNull?
    let roleID: Int?
    let type, createdAt, updatedAt: String?
    let client: Client?
    let sellerInfo: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, city, address
        case phoneNumber = "phone_number"
        case shippingAddress = "shipping_address"
        case roleID = "role_id"
        case type
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case client
        case sellerInfo = "seller_info"
    }
}

// MARK: - Client
struct Client: Codable {
    let id, userID, countryID, regionID: Int?
    let city: String?
    let zipCode: JSONNull?
    let address, phoneNumber: String?
    let image: String?
    let createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case countryID = "country_id"
        case regionID = "region_id"
        case city
        case zipCode = "zip_code"
        case address
        case phoneNumber = "phone_number"
        case image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


// MARK: - RegisterModel
struct RegisterModel: Codable {
    let status: Int?
    let apiToken: String?
    let user: user?
    
    enum CodingKeys: String, CodingKey {
        case status
        case apiToken = "api_token"
        case user
    }
}

// MARK: - User
struct user: Codable {
    let name, email, phoneNumber, type: String?
    let updatedAt, createdAt: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, email
        case phoneNumber = "phone_number"
        case type
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}

