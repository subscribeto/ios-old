//
//  User.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct User : Decodable {
	
	struct Birthday : Decodable {
		let month: Int
		let day: Int
		let year: Int
	}
	
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
	let gender: Int?
	let birthday: Birthday?
	static var token: String?
	
	static func signUp (
		email: String,
		password: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<API.TokenResponse>
	) {
		var req = API.Request(method: .post, endpoint: "/user/auth/sign-up")
		req.set(body: ["email": email, "password": password])
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func signUpFinalize (
		token: String,
		code: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<API.TokenResponse>
	) {
		var req = API.Request(method: .post, endpoint: "/user/auth/sign-up/finalize")
		req.set(body: ["token": token, "code": code])
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func signIn (
		email: String,
		passsword: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<API.TokenResponse>
	) {
		var req = API.Request(method: .post, endpoint: "/user/auth/sign-in")
		req.set(body: ["email": email, "password": passsword])
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func signIn (
		code: String,
		token: API.Token,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<API.TokenResponse>
	) {
		var endpoint: String
		switch token {
		case .sms:
			endpoint = "/user/auth/sign-in/sms"
		case .totp:
			endpoint = "/user/auth/sign-in/totp"
		default:
			return failureHandler(API.NetworkError(code: .unknown, message: "You cannot finish sign in with this token."))
		}
		var req = API.Request(method: .post, endpoint: endpoint)
		req.set(body: ["token": token, "code": code])
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getMe (
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<User>
	) {
		var req = API.Request(method: .get, endpoint: "/user/me")
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getSession (
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
		) {
		var req = API.Request(method: .get, endpoint: "/user/me/session")
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func set (
		businessId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
		) {
		var req = API.Request(method: .put, endpoint: "/user/me/session/business")
		req.set(body: ["id": businessId])
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func set (
		firstName: String,
		lastName: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
		) {
		var req = API.Request(method: .put, endpoint: "/user/me/account/name")
		req.set(body: ["firstName": firstName, "lastName": lastName])
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func set (
		gender: User.Gender,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
		) {
		var req = API.Request(method: .put, endpoint: "/user/me/account/gender")
		req.set(body: ["gender": gender.rawValue])
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func set (
		month: Int,
		day: Int,
		year: Int,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
		) {
		var req = API.Request(method: .put, endpoint: "/user/me/account/birthday")
		req.set(body: ["month": month, "day": day, "year": year])
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func set (
		oldPassword old: String,
		newPassword new: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
		) {
		var req = API.Request(method: .put, endpoint: "/user/me/account/security/password")
		req.set(body: ["old": old, "new": new])
		req.addToken()
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	
	
}
