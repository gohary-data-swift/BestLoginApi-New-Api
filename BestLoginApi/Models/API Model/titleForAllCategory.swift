

import Foundation
struct tableTitle : Codable {
	let id : Int?
	let parent_id : Int?
	let name : String?
	let is_active : Int?
	let include_in_menu : Int?
	let display_products : Int?
	let level : Int?
	let sort_order : Int?
	let created_at : String?
	let updated_at : String?
	let children_count : Int?
	let image : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case parent_id = "parent_id"
		case name = "name"
		case is_active = "is_active"
		case include_in_menu = "include_in_menu"
		case display_products = "display_products"
		case level = "level"
		case sort_order = "sort_order"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case children_count = "children_count"
		case image = "image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		parent_id = try values.decodeIfPresent(Int.self, forKey: .parent_id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		is_active = try values.decodeIfPresent(Int.self, forKey: .is_active)
		include_in_menu = try values.decodeIfPresent(Int.self, forKey: .include_in_menu)
		display_products = try values.decodeIfPresent(Int.self, forKey: .display_products)
		level = try values.decodeIfPresent(Int.self, forKey: .level)
		sort_order = try values.decodeIfPresent(Int.self, forKey: .sort_order)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		children_count = try values.decodeIfPresent(Int.self, forKey: .children_count)
		image = try values.decodeIfPresent(String.self, forKey: .image)
	}

}
