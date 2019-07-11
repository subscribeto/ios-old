//
//  Business.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct Business : Decodable {
	
	let name: String
	let lat: Double
	let lng: Double
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
}
