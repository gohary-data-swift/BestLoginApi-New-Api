

import Foundation

struct SellerInfo : Codable {
	let id : Int?
	let seller_id : Int?
	let seller_type : String?
	let name : String?
	let city : String?
	let address : String?
	let phone_number : String?
	let image : String?
	let rate : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case seller_id = "seller_id"
		case seller_type = "seller_type"
		case name = "name"
		case city = "city"
		case address = "address"
		case phone_number = "phone_number"
		case image = "image"
		case rate = "rate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		seller_id = try values.decodeIfPresent(Int.self, forKey: .seller_id)
		seller_type = try values.decodeIfPresent(String.self, forKey: .seller_type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		rate = try values.decodeIfPresent(Int.self, forKey: .rate)
	}

}
