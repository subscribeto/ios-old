//
//  S2UINavigationController.swift
//  subscribeto
//
//  Created by Elijah Cobb on 13/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2UINavigationController : UINavigationController {
	
	override func viewDidLoad() {
		
		self.navigationBar.isTranslucent = false
		self.navigationBar.barTintColor = S2UITheme.darkBackground
		self.navigationBar.tintColor = S2UITheme.white
		self.navigationBar.titleTextAttributes = [.foregroundColor: S2UITheme.white]
		
		let grabber = UIView()
		grabber.backgroundColor = S2UITheme.white
		grabber.useAutoLayout()
		grabber.layer.cornerRadius = 0
		
		self.navigationBar.addSubview(grabber)
		
		NSLayoutConstraint.activate([
			grabber.widthAnchor.constraint(equalToConstant: 40),
			grabber.heightAnchor.constraint(equalToConstant: 10),
			grabber.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: -10),
			grabber.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor)
		])
		
		
	}
	
}
