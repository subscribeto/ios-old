//
//  API.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation
import AwaitKit
import PromiseKit

struct ECHTTPRequest {
	
	enum HTTPMethod: String {
		case get = "GET"
		case post = "POST"
		case put = "PUT"
		case delete = "DELETE"
	}
	
	enum RequestError: Error {
		case invalidUrl
		case unknown
	}
	
	var method: HTTPMethod?
	var endpoint: String?
	var body: Data?
	var headers: [String : String] = [String : String]()
	static var baseUrl: String = "http://api.scribe.to"
	
	init(method: HTTPMethod, endpoint: String) {
		self.method = method
		self.endpoint = endpoint
	}
	
	mutating func set(body value: [String: Any]?) {
		
		guard let value = value else { return }
		guard let data: Data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) else { return }
		
		self.body = data
		self.set(header: "Content-Type", value: "application/json")
		
	}
	
	mutating func set(header: String, value: String) {
		
		self.headers[header] = value
		
	}
	
	mutating func set(token: String) {
		
		self.headers["Authorization"] = "Bearer \(token)"
		
	}
	
	func fetch() throws -> ECHTTPResponse {
		
		let sephamore = DispatchSemaphore(value: 0)
		
		var res: ECHTTPResponse?
		var err: Error?
		
		self.fetch { (r: ECHTTPResponse?, e: Error?) in
			
			res = r
			err = e
			
			sephamore.signal()
			
		}
		
		sephamore.wait()
		
		if let response = res {
			
			return response
			
		} else {
			
			if let error = err {
				
				throw error
				
			} else {
				
				throw RequestError.unknown
				
			}
			
		}
		
	}
	
	func fetch(_ completion: @escaping (ECHTTPResponse?, Error?) -> Void) {
		
		guard let endpoint = self.endpoint else { return completion(nil, RequestError.invalidUrl) }
		let urlString = ECHTTPRequest.baseUrl + endpoint
		guard let url = URL(string: urlString) else { return completion(nil, RequestError.invalidUrl) }
		var request = URLRequest(url: url)
		request.allHTTPHeaderFields = headers
		request.httpMethod = self.method?.rawValue
		if let body = self.body { request.httpBody = body }
		
		URLSession.shared.dataTask(with: request) { (d, u, e) in
			
			if let err = e {
				
				completion(nil, err)
				
			} else {
				
				completion(ECHTTPResponse(d, u), nil)
				
			}
			
		}.resume()
		
	}
	
	func fetch() -> Promise<ECHTTPResponse> {
		return Promise.init(resolver: { (resolver) in
			fetch({ (r, e) in
				if let response = r {
					resolver.fulfill(response)
				} else if let error = e {
					resolver.reject(error)
				}
			})
		})
	}
	
}


struct ECHTTPResponse {
	
	let status: Int
	let headers: [AnyHashable : Any]
	let body: Data?
	
	init(_ d: Data?, _ r: URLResponse?) {
		
		if let res = r as? HTTPURLResponse {
			
			self.status = res.statusCode
			self.headers = res.allHeaderFields
			
			
		} else {
			
			self.status = 0
			self.headers = [AnyHashable: Any]()
			
		}
		
		self.body = d
		
	}
	
	func getDictionary<T : Decodable>() -> T? {
		
		if let data = self.body {
			
			return try? JSONDecoder().decode(T.self, from: data)
			
		} else {
			
			return nil
			
		}
		
	}
	
	func getString() -> String? {
		
		if let data = self.body {
			
			return String.init(data: data, encoding: String.Encoding.utf8)
			
		} else {
			
			return nil
			
		}
		
	}
	
}
