//
//  Subscription.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct Subscription: Decodable {
	
	let userId: String
	let businessId: String
	let programId: String
	let autoRenew: Bool
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
}
