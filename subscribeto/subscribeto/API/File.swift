//
//  File.swift
//  subscribeto
//
//  Created by Elijah Cobb on 11/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

struct File : Decodable {
	
	let data: String
	let updatedAt: Int
	
	
	func decode() -> Data? {
		
		return Data.init(base64Encoded: self.data)
		
	}
	
	func getImage() -> UIImage? {
		
		guard let data = self.decode() else { return nil }
		return UIImage.init(data: data)
		
	}
}
