//
//  SignInVC.swift
//  subscribeto
//
//  Created by Elijah Cobb on 28/06/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit


class SignInVC: UIViewController {
	
	@IBOutlet var imageViewHeightConstraint: NSLayoutConstraint!
	@IBOutlet var buttonTrayBaseConstraint: NSLayoutConstraint!
	@IBOutlet var emailField: S2UIField!
	@IBOutlet var passwordField: S2UIField!
	@IBOutlet var signInButton: S2UIButton!
	@IBOutlet var signUpButton: S2UIButton!
	
	func handleFieldKeyboardUpdate(_ frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 20)) {
		
		self.buttonTrayBaseConstraint.constant = frame.size.height - 20
		self.imageViewHeightConstraint.constant = self.view.frame.size.height - self.buttonTrayBaseConstraint.constant - 300
		
		UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
			
			self.view.layoutIfNeeded()
			
		})
	}
	
	func signIn() {
		
		
		
	}
	
	func signUp() {
		
		
		
	}

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		emailField.setType(type: .email)
		passwordField.setType(type: .password)
		
		passwordField.onEndEditing { self.handleFieldKeyboardUpdate() }
		emailField.onEndEditing { self.handleFieldKeyboardUpdate() }
		
		emailField.onKeyboardWillChangeFrame(handleFieldKeyboardUpdate)
		passwordField.onKeyboardWillChangeFrame(handleFieldKeyboardUpdate)
		
		signInButton.onClick(signIn)
		signUpButton.onClick(signUp)
		
	}

}

