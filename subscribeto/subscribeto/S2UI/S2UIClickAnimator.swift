//
//  S2UIClickAnimator.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

protocol S2UIClickAnimator: S2UIClickManagerDelagate {}

extension S2UIClickAnimator {
	
	func updateViewForTouchStatus(isBeingTouched: Bool) {
		
		let scale: CGFloat = isBeingTouched ? 1.1 : 1
		let duration: Double = isBeingTouched ? 0.5 : 0.5
		let damping: CGFloat = isBeingTouched ? 0.55 : 0.25
		let velocity: CGFloat = isBeingTouched ? 0.25 : 0.25
		
		UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [], animations: {
			
			self.transform = CGAffineTransform(scaleX: scale, y: scale)
			
		})
		
	}
	
}
