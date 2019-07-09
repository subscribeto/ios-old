//
//  S2Error.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation

class S2Error {
	
	private var message: String = "Unexpected error. Please try again later."
	private var shouldShow: Bool = false
	
	public func msg(_ value: String) -> S2Error {
	
		message = value
		return self
		
	}
	
	public func show() -> S2Error {
		
		shouldShow = true
		return self
		
	}
	
	public func hide() -> S2Error {
		
		shouldShow = false
		return self
		
	}
	
}
