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
	
	static func create (
		forProgram programId: String,
		withAutoRenewal autoRenew: Bool,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		var req = API.Request(method: .post, endpoint: "/subscription")
		req.set(body: ["programId": programId, "autoRenew": autoRenew])
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getFor (
		id subscriptionId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		var req = API.Request(method: .put, endpoint: "/subscription/\(subscriptionId)")
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getForMe (
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		var req = API.Request(method: .put, endpoint: "/subscription/user/me")
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func set (
		autoRenew: Bool,
		for subscriptionId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		var req = API.Request(method: .put, endpoint: "/subscription/\(subscriptionId)/auto-renew")
		req.set(body: ["autoRenew": autoRenew])
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func renew (
		for subscriptionId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		var req = API.Request(method: .put, endpoint: "/subscription/\(subscriptionId)/renew")
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	
}
