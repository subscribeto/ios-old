//
//  Session.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct Session : Decodable {
	let userId: String
	let businessId: String?
	let dead: Bool
	let id: String
	let updatedAt: Int
	let createdAt: Int
}
