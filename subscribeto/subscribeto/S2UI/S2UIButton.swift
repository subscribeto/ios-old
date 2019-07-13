//
//  S2UIButton.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2UIButton : S2UIView, S2UIClickAnimator {
	
	var onClick: () -> Void
	private var text : String
	private let label: UILabel
	let clickManager: S2UIClickManager
	
	init(text: String, onClick: @escaping () -> Void) {
		
		self.text = text
		self.onClick = onClick
		self.label = UILabel()
		self.clickManager = S2UIClickManager()
		
		super.init()
		
		self.clickManager.start(delegate: self)
		
		self.label.text = self.text
		self.label.useAutoLayout()
		self.label.textAlignment = .center
		self.label.textColor = S2UITheme.white
		self.label.font = UIFont.systemFont(ofSize: self.label.font.pointSize, weight: .bold)
		
		self.addSubview(self.label)
		self.backgroundColor = S2UITheme.primary
		self.layer.cornerRadius = 10
		self.clipsToBounds = true
		
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[l]-10-|", options: [], metrics: nil, views: ["l": self.label]))
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[l]-10-|", options: [], metrics: nil, views: ["l": self.label]))
		
	}
	
	convenience override init() { self.init(text: "", onClick: {}) }
	convenience init(text: String) { self.init(text: text, onClick: {}) }
	convenience init(onClick: @escaping () -> Void) { self.init(text: "", onClick: onClick) }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func clicked() {
		onClick()
	}
	
}
