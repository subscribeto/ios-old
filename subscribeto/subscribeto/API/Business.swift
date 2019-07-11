//
//  Business.swift
//  subscribeto
//
//  Created by Elijah Cobb on 10/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation
import MapKit

struct Business : Decodable {
	
	let name: String
	let lat: Double
	let lng: Double
	
	let id: String
	let updatedAt: Int
	let createdAt: Int
	
	
	static func getFor (
		id businessId: String,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		let req = API.Request(method: .put, endpoint: "/business/\(businessId)")
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getFor (
		latitudue lat: Double,
		longitude lng: Double,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
		) {
		var req = API.Request(method: .put, endpoint: "/business/near")
		req.set(body: ["lat": lat, "lng": lng])
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
	static func getNear (
		location: CLLocationCoordinate2D,
		onFailure failureHandler: @escaping API.FailureHandler,
		onSuccess successHandler: @escaping API.SucccessHandler<Session>
	) {
		var req = API.Request(method: .put, endpoint: "/business/near")
		req.set(body: ["lat": location.latitude, "lng": location.longitude])
		req.fetch(onFailure: failureHandler, onSuccess: successHandler)
	}
	
}
