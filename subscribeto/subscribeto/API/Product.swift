//
//  Product.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct Product : Decodable {
	
	let name: String
	let description: String
	let businessId: String
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
}
