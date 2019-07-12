//
//  S2UIClicker.swift
//  subscribeto
//
//  Created by Elijah Cobb on 11/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2UIClicker : UIView {
	
	var isBeingClicked: Bool = false
	private var onClickHandler: (() -> Void)?
	
	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)
		
	}
	
	func onClick(_ handler: @escaping () -> Void) {
		onClickHandler = handler
	}
	
	func modifyView(isBeingClicked: Bool) {
		
		self.isBeingClicked = isBeingClicked
		let scale: CGFloat = isBeingClicked ? 1.1 : 1
		let time: Double = isBeingClicked ? 1 : 0.5
		UIView.animate(withDuration: time, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 0.25, options: [], animations: {
			self.transform = CGAffineTransform(scaleX: scale, y: scale)
		})
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		modifyView(isBeingClicked: true)
		
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		for touch in touches {
			
			let point = touch.location(in: self)
			if point.x < 0 || point.y < 0 { return modifyView(isBeingClicked: false) }
			
		}
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		let beingClicked = self.isBeingClicked
		modifyView(isBeingClicked: false)
		
		if beingClicked { if let handler = self.onClickHandler { handler() } }
		
		
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		modifyView(isBeingClicked: false)
		
	}
	
}
