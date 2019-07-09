//
//  API.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

struct S2NetworkError {
	let code: Int
	let msg: String
}

struct S2Request {
	
	enum Method: String {
		case get = "GET"
		case post = "POST"
		case delete = "DELETE"
		case put = "PUT"
	}
	
	enum Token {
		case session
		case totp(String)
		case email(String)
		case sms(String)
	}
	
	static let baseUrl = "http://api.scribe.to"
	static var sessionToken: String?
	
	var method: Method
	var endpoint: String
	var token: Token
	
	func makeRequest(_ handler: @escaping (Data?, S2NetworkError?) -> Void) {
		
		let session = URLSession.init()
		guard let url = URL.init(string: S2Request.baseUrl + "/" + endpoint) else { return handler(nil, S2NetworkError(code: -1, msg: "The url created was invalid.")) }
		let urlRequest = URLRequest.init(url: url)
		
		session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
			
			if data != nil { handler(data, nil) }
			else {
				
				guard let err = error else {
					return handler(nil, S2NetworkError(code: -1, msg: "Both "))
				}
				
				handler(nil, S2NetworkError(code: -1, msg: err.localizedDescription))
				
			}
			
		}
		
	}
	
}
