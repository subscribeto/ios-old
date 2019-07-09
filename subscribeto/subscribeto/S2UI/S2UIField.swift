//
//  S2UI.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2UIField: UIView {
	
	enum Mode {
		case email
		case password
	}
	
	private var field: UITextField
	private var editingDidEndHandler: (() -> Void)?
	private var editingDidBeginHandler: (() -> Void)?
	private var keyboardWillChangeFrameHandler: ((_ value: CGRect) -> Void)?
	private var isEditing: Bool = true
	
	// MARK: Direct Event Handlers
	
	@objc private func editingDidEnd() {
		
		if !isEditing { return }
		if let handler = editingDidEndHandler { handler() }
		stopKeyboardListener()
		isEditing = false
		
	}
	
	@objc private func editingDidBegin() {
		
		isEditing = true
		if let handler = editingDidBeginHandler { handler() }
		startKeyboardListener()
		
	}
	
	@objc private func keyboardWillChangeFrameNotification(notification: NSNotification) {
		
		guard let userInfo = notification.userInfo else { return }
		guard let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
		guard let handler = self.keyboardWillChangeFrameHandler else { return }
	
		handler(frame)
		
	}
	
	// MARK: Modifiers
	
	func becomeActive() -> Void {
		 _ = field.becomeFirstResponder()
	}
	
	func setPlaceholder(_ value: String) {
		
		field.attributedPlaceholder = NSAttributedString(string: value, attributes: [NSAttributedString.Key.foregroundColor: UIColor.subscribeto.blue3])
		
	}
	
	func setType(type: Mode) {
		
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
	
	// MARK: Event Handlers
	
	func onEndEditing(_ handler: @escaping () -> Void) {
		
		editingDidEndHandler = handler
		
	}
	
	func onStartEditing(_ handler: @escaping () -> Void) {
		
		editingDidBeginHandler = handler
		
	}
	
	func onKeyboardWillChangeFrame(_ handler: @escaping (_ value: CGRect) -> Void) {
		
		keyboardWillChangeFrameHandler = handler
		
	}
	
	func startKeyboardListener() {
		
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(keyboardWillChangeFrameNotification),
			name: UIResponder.keyboardWillChangeFrameNotification,
			object: nil
		)
		
	}
	
	func stopKeyboardListener() {
		
		NotificationCenter.default.removeObserver(self)
		
	}
	
	// MARK: Initialize and Deinitialize
	
	required init?(coder aDecoder: NSCoder) {
		
		field = UITextField()
		
		super.init(coder: aDecoder)

		field.frame = CGRect(x: 20, y: 8, width: frame.width - 28, height: frame.height - 16)
		field.text = ""
		field.keyboardAppearance = .dark
		field.backgroundColor = .clear
		field.returnKeyType = .continue
		field.tintColor = UIColor.subscribeto.blue1
		field.textColor = UIColor.subscribeto.blue1
		field.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
		field.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEndOnExit)
		field.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
		self.addSubview(field)
		
		self.backgroundColor = .black;
		self.layer.borderColor = UIColor.subscribeto.blue2.cgColor
		self.layer.borderWidth = 4
		self.layer.cornerRadius = 10
		self.autoresizesSubviews = true
	}
	
	deinit {
		
		stopKeyboardListener()
		
	}
	
}
