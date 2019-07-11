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
	
	static func getFor (
		id programId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Program>
	) {
		let req = API.Request(method: .put, endpoint: "/program/\(programId)")
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getAllFor (
		product productId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		let req = API.Request(method: .put, endpoint: "/program/product/\(productId)")
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getAllFor (
		business businessId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		let req = API.Request(method: .put, endpoint: "/program/business/\(businessId)")
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getAllFor (
		businessWhereClosed businessId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		let req = API.Request(method: .put, endpoint: "/program/business/\(businessId)/closed")
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
}
