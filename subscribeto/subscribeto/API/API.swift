//
//  APIRequests.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

extension Data {
	
	func utf8EncodedString() -> String? {
		return String.init(data: self, encoding: .utf8)
	}
	
}

struct API {
	
	typealias SucccessHandler<T> = (T) -> Void
	typealias FailureHandler = (API.NetworkError) -> Void
	
	struct NetworkError {
		let code: NetworkStatusCode
		let message: String
	}

	enum Token : String, Decodable {
		case session = "session"
		case sms = "sms"
		case totp = "totp"
		case signUp = "sign-up"
	}
	
	struct ErrorResponse: Decodable {
		let error: String
	}
	
	struct TokenResponse : Decodable {
		let token: String
		let type: Token
	}
	
	struct DecodedResponse<T : Decodable> {
		
		let object: T
		let status: NetworkStatusCode
		
	}
	
	enum NetworkStatusCode: Int {
		case good = 200
		case badRequest = 400
		case unauthorized = 401
		case notFount = 404
		case server = 500
		case decoding = 999
		case unknown
	}
	
	struct Request {
		
		enum HTTPMethod: String {
			case get = "GET"
			case post = "POST"
			case put = "PUT"
			case delete = "DELETE"
		}
		
		var method: HTTPMethod?
		var endpoint: String?
		var body: Data?
		var headers: [String : String] = [String : String]()
		static var baseUrl: String = "http://localhost:3000"
		static var verboseLogging: Bool = true
		
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
		
		mutating func addToken() {
			
			guard let token = User.token else { return print("You have not set the User token.") }
			self.headers["Authorization"] = "Bearer \(token)"
			
		}
		
		
		func fetchRaw(onFailure failureHandler: @escaping (NetworkError) -> Void, onSuccess successHandler: @escaping (Response) -> Void) {

			
			guard let endpoint = self.endpoint else { return failureHandler(NetworkError(code: .unknown, message: "Endpoint is nil.")) }
			let urlString = Request.baseUrl + endpoint
			guard let url = URL(string: urlString) else { return failureHandler(NetworkError(code: .unknown, message: "Failed to create url.")) }
			var request = URLRequest(url: url)
			request.allHTTPHeaderFields = headers
			request.httpMethod = self.method?.rawValue
			if let body = self.body { request.httpBody = body }
			
			if Request.verboseLogging {
				print("\nMaking Request to \(Request.baseUrl):\nendpoint: \(endpoint)\nmethod: \(request.httpMethod ?? "")\ntoken: \(headers["Authorization"] ?? "no_auth")\nbody: \(request.httpBody?.utf8EncodedString() ?? "no_body")\n")
			}
			
			URLSession.shared.dataTask(with: request) { (d, u, e) in
				
				if let err = e {
					
					failureHandler(NetworkError(code: .unknown, message: err.localizedDescription))
					
				} else {
					
					successHandler(Response(d, u))
					
				}
				
				}.resume()
			
		}
		
		func fetch<T : Decodable>(onFailure failureHandler: @escaping (NetworkError) -> Void, onSuccess successHandler: @escaping (T) -> Void) {
			fetchRaw(onFailure: failureHandler) { (response) in
				let d: T? = response.decode()
				if let decodedObject = d {
					
					successHandler(decodedObject)
					
				} else {
					
					let e: ErrorResponse? = response.decode()
					if let errorObject = e {
						
						failureHandler(NetworkError.init(code: response.status, message: errorObject.error))
						
					} else {
						
						failureHandler(NetworkError.init(code: .decoding, message: "Failed to decode object."))
						print("API FAILED TO DECODE \(T.self)\n\(response.getString())")
						
					}
					
				}
			}
		}
		
	}
	
	struct Response {
		
		let status: NetworkStatusCode
		let headers: [AnyHashable : Any]
		let body: Data?
		
		init(_ d: Data?, _ r: URLResponse?) {
			
			if let res = r as? HTTPURLResponse {
				
				self.status = NetworkStatusCode(rawValue: res.statusCode) ?? .unknown
				self.headers = res.allHeaderFields
				
				
			} else {
				
				self.status = .unknown
				self.headers = [AnyHashable: Any]()
				
			}
			
			self.body = d
			
		}
		
		func decode<T : Decodable>() -> T? {
			
			do {
				
				return try JSONDecoder().decode(T.self, from: self.body!)
				
			} catch {
				
				print("Failed to parse JSON")
				dump(error)
				
			}
			
			return nil
			
		}
		
		func getString() -> String {
			
			if let data = self.body {
				
				return String.init(data: data, encoding: String.Encoding.utf8) ?? ""
				
			} else {
				
				return ""
				
			}
			
		}
		
	}

}
