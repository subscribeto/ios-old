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
	
	static func getAllFor (
		business businessId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		let req = API.Request(method: .put, endpoint: "/product/business/\(businessId)")
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getFor (
		id productId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		let req = API.Request(method: .put, endpoint: "/product/\(productId)")
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
}
