//
//  S2UIButton.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2UIButton: UIButton {
	
	enum Mode {
		case primary
		case secondary
	}
	
	private var doneHandler: (() -> Void)?
	
	func setTitle(_ value: String) { self.setTitle(value, for: .normal) }
	func onClick(_ handler: @escaping () -> Void) { doneHandler = handler }
	@objc func handleClick() { if let handler = doneHandler { handler() }}
	
	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)
		
		self.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
		self.layer.cornerRadius = 10
		
		setType(.primary)
		
	}
	
	public func setType(_ type: Mode) {
		
		self.backgroundColor = type == .primary ? UIColor.subscribeto.blue1 : .clear
		self.setTitleColor(type == .primary ? UIColor.subscribeto.blue4 : UIColor.subscribeto.blue1, for: .normal)
		self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: type == .primary ? .bold : .regular)
		
	}
	
}
