//
//  Program.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct Program : Decodable {
	
	let productId: String
	let businessId: String
	let price: Int
	let allowance: Int
	let closed: Bool
	
	let successorId: String?
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
}
