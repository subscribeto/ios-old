//
//  APIRequests.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation
import AwaitKit
import PromiseKit

struct API {
	
	struct NetworkError {
		let code: Int
		let message: String
	}

	static func signUp(email: String, password: String) -> Promise<Void> {
		return async {
			var req = ECHTTPRequest(method: .post, endpoint: "/user/auth/sign-up")
			req.set(body: ["email": email, "password": password])
			let res = try await(req.fetch())
			
			print(res.status)
		}
	}
}
