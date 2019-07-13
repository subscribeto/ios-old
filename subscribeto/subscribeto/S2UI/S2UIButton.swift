//
//  S2UIButton.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2UIButton : UIView {
	
	var onClick: () -> Void
	private var text : String
	private let label: UILabel
	
	init(text: String, onClick: @escaping () -> Void) {
		
		self.text = text
		self.onClick = onClick
		self.label = UILabel()
		
		super.init(frame: CGRect())
		
		self.label.text = self.text
		self.label.translatesAutoresizingMaskIntoConstraints = false
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
	
	convenience init() { self.init(text: "", onClick: {}) }
	convenience init(text: String) { self.init(text: text, onClick: {}) }
	convenience init(onClick: @escaping () -> Void) { self.init(text: "", onClick: onClick) }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func isBeingTouched(_ beingTouched: Bool) {
		
		let scale: CGFloat = beingTouched ? 1.1 : 1
		let duration: Double = beingTouched ? 0.5 : 0.5
		let damping: CGFloat = beingTouched ? 0.55 : 0.25
		let velocity: CGFloat = beingTouched ? 0.25 : 0.25
		
		UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [], animations: {
			
			self.transform = CGAffineTransform(scaleX: scale, y: scale)
			
		})
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		isBeingTouched(true)
		
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		for touch in touches {
			
			let point = touch.location(in: self)
			if point.x < 0 || point.x > self.frame.size.width || point.y < 0 || point.y > self.frame.size.height {
				
				isBeingTouched(false)
				return
				
			}
			
		}
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		isBeingTouched(false)
		
	}
	
}
