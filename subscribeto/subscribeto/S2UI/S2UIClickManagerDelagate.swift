//
//  S2UIClickAnimator.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

protocol S2UIClickManagerDelagate : S2UIView {
	
	func updateViewForTouchStatus(isBeingTouched: Bool)
	func clicked()
	
}

class S2UIClickManager {
	
	private func check(touches: Set<UITouch>, inDelegate delegate: S2UIClickManagerDelagate) -> Bool {
		
		for touch in touches {
			
			let point = touch.location(in: delegate)
			if point.x < 0 || point.x > delegate.frame.size.width || point.y < 0 || point.y > delegate.frame.size.height {
				
				return false
				
			}
			
		}
		
		return true
		
	}
	
	func start(delegate: S2UIClickManagerDelagate) {
		
		delegate.onTouchesBegan = { (touches, event) in
			
			delegate.updateViewForTouchStatus(isBeingTouched: true)
			
		}
		
		delegate.onTouchesMoved = { (touches, event) in
			
			if !self.check(touches: touches, inDelegate: delegate) {
				
				delegate.updateViewForTouchStatus(isBeingTouched:false)
				
			}
			
		}
		
		delegate.onTouchesEnded = { (touches, event) in
			
			if self.check(touches: touches, inDelegate: delegate) { delegate.clicked() }
			delegate.updateViewForTouchStatus(isBeingTouched: false)
			
		}
		
		delegate.onTouchesCancelled = { (touches, event) in
			
			delegate.updateViewForTouchStatus(isBeingTouched: false)
			
		}
		
	}
	
}
