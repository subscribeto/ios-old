//
//  S2UITouchable.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

extension UIView {
	
	func addSubviews(_ subviews: UIView...) {
		
		for subview in subviews { self.addSubview(subview) }
		
	}
	
	func useAutoLayout() {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		
	}
	
}


class S2UIView : UIView {
	
	typealias TouchEventHandler = ((Set<UITouch>, UIEvent?) -> Void)
	var onTouchesBegan: TouchEventHandler?
	var onTouchesMoved: TouchEventHandler?
	var onTouchesEnded: TouchEventHandler?
	var onTouchesCancelled: TouchEventHandler?
	
	public init() {
		
		super.init(frame: CGRect())
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		if let handler = self.onTouchesBegan { handler(touches, event) }
		
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		if let handler = self.onTouchesMoved { handler(touches, event) }
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		if let handler = self.onTouchesEnded { handler(touches, event) }
		
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		if let handler = self.onTouchesCancelled { handler(touches, event) }
		
	}
}
