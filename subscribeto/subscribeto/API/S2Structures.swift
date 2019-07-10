//
//  S2Structures.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct User : Decodable {
	
	enum Gender: Int, Decodable {
		case male = 0
		case female = 1
		case other = 2
	}
	
	let email: String
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
	let firstName: String?
	let lastName: String?
	let phone: String?
	let gender: Gender?
	let birthday: String?
	
}

struct Business : Decodable {
	
	let name: String
	let lat: Double
	let lng: Double
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
}

struct Product : Decodable {
	
	let name: String
	let description: String
	let businessId: String
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
}

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

struct Subscription: Decodable {
	
	let userId: String
	let businessId: String
	let programId: String
	let autoRenew: Bool
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
}

struct SignInResponse: Decodable {
	let token: String
	let type: String
}

struct GeneralErrorResponse: Decodable {
	let error: String
}


struct TypeErrorResponse: Decodable {
	
	struct TypeErrors: Decodable {
		
		struct TypeError: Decodable {
			let expected: String
			let actual: String
		}
		
		let path: String
		let type: TypeError
	}
	
	struct TypeErrorRoot: Decodable {
		let type: [TypeErrors]
	}
	
	let errors: TypeErrorRoot
	
}


struct UserSignUp : Decodable {
	
	let token: String
	let type: String
	
}
