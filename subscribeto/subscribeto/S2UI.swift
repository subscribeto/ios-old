//
//  S2UI.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2Button: UIButton {
	
	private var doneHandler: (() -> Void)?
	
	func setTitle(_ value: String) { self.setTitle(value, for: .normal) }
	func onClick(_ handler: @escaping () -> Void) { doneHandler = handler }
	@objc func handleClick() { if let handler = doneHandler { handler() }}
	
	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)
		
		self.backgroundColor = UIColor.subscribeto.blue1
		self.setTitleColor(UIColor.subscribeto.blue4, for: .normal)
		self.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
		self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		self.layer.cornerRadius = 10
		
	}
	
}

class S2Field: UIView {
	
	enum S2FieldType {
		case email
		case password
	}
	
	private var field: UITextField
	private var doneHandler: ((_ value: String) -> Void)?
	private var keyboardHeightDidChangeHandler: ((_ value: CGRect) -> Void)?
	
	func becomeActive() -> Void {
		 _ = field.becomeFirstResponder()
	}
	
	@objc func editingDidEnd() {
		
		if let handler = doneHandler { handler(field.text!) }
		
	}
	
	func setPlaceholder(_ value: String) {
		
		field.attributedPlaceholder = NSAttributedString(string: value, attributes: [NSAttributedString.Key.foregroundColor: UIColor.subscribeto.blue3])
		
	}
	
	func setType(type: S2FieldType) {
		
		switch type {
			case .email:
				setPlaceholder("email")
				field.keyboardType = .emailAddress
				field.autocapitalizationType = .none
				field.textContentType = .emailAddress
				break;
			case .password:
				setPlaceholder("password")
				field.keyboardType = .asciiCapable
				field.isSecureTextEntry = true
				field.autocapitalizationType = .none
				field.textContentType = .newPassword
				break;
		}
		
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	@objc func handleKeyboardChanged(notification: NSNotification) {
		
		guard let userInfo = notification.userInfo else { return }
		guard let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
		guard let handler = self.keyboardHeightDidChangeHandler else { return }
		
		handler(frame)
		
	}
	
	func onDone(_ handler: @escaping (_ value: String) -> Void) {
		
		doneHandler = handler
		
	}
	
	func onKeyboardDidPresent(_ handler: @escaping (_ value: CGRect) -> Void) {
		
		keyboardHeightDidChangeHandler = handler
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		field = UITextField()
		
		super.init(coder: aDecoder)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(self.handleKeyboardChanged(notification:)),
											   name: UIResponder.keyboardWillChangeFrameNotification,
											   object: nil)

		field.frame = CGRect(x: 20, y: 8, width: frame.width - 28, height: frame.height - 16)
		field.text = ""
		field.keyboardAppearance = .dark
		field.backgroundColor = .clear
		field.returnKeyType = .done
		field.tintColor = UIColor.subscribeto.blue1
		field.textColor = UIColor.subscribeto.blue1
		field.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEndOnExit)
		self.addSubview(field)
		
		self.backgroundColor = .black;
		self.layer.borderColor = UIColor.subscribeto.blue2.cgColor
		self.layer.borderWidth = 4
		self.layer.cornerRadius = 10
		self.autoresizesSubviews = true
	}
	
}
