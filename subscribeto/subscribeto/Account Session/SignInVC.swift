//
//  SignInVC.swift
//  subscribeto
//
//  Created by Elijah Cobb on 28/06/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit


class SignInVC: UIViewController {
	
	@IBOutlet var topViewContraint: NSLayoutConstraint!
	@IBOutlet var topView: UIView!
	@IBOutlet var topLabel: UILabel!
	@IBOutlet var emailField: S2Field!
	@IBOutlet var passwordField: S2Field!
	@IBOutlet var signUpButton: S2Button!
	
	func handleKeyboardDidPresent(frame: CGRect) {
		
		let h1 = self.view.frame.size.height
		let h2 = signUpButton.frame.size.height
		let h3 = passwordField.frame.size.height
		let h4 = emailField.frame.size.height
		let h5 = frame.size.height
		topViewContraint.constant = h1 - h2 - h3 - h4 - h5 - 140
		
		self.view.layoutIfNeeded()
		
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.subscribeto.black
		topLabel.textColor = UIColor.subscribeto.blue1
		
		emailField.setType(type: .email)
		emailField.onDone { (value: String) in
			
			print("Email: \(value)")
			self.passwordField.becomeActive()
			
		}
		emailField.onKeyboardDidPresent(handleKeyboardDidPresent)
		passwordField.onKeyboardDidPresent(handleKeyboardDidPresent)
		passwordField.setType(type: .password)
		handleKeyboardDidPresent(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
	}

}

