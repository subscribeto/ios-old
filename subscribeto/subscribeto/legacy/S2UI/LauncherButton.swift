//
//  LauncherButton.swift
//  subscribeto
//
//  Created by Elijah Cobb on 11/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class LauncherButton : S2UIClicker {
	
	private var label: UILabel
	private var imageView: UIImageView
	
	required init?(coder aDecoder: NSCoder) {
		
		label = UILabel()
		imageView = UIImageView()
		
		super.init(coder: aDecoder)
		
		self.layer.cornerRadius = 20
		self.layer.backgroundColor = UIColor.subscribeto.primary.cgColor
		
		label.text = ""
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textAlignment = .center
		label.textColor = UIColor.subscribeto.white
		label.translatesAutoresizingMaskIntoConstraints = false
		
		imageView.image = UIImage.init()
		imageView.tintColor = UIColor.subscribeto.white
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(label)
		self.addSubview(imageView)
		
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[l]-(10)-|", options: [], metrics: nil, views: ["l": label]))
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[i]-(10)-|", options: [], metrics: nil, views: ["i": imageView]))
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(10)-[i]-(10)-[l(20)]-(10)-|", options: [], metrics: nil, views: ["l": label, "i": imageView]))
		
		self.applyMotion()
		
	}
	
	func set(icon imageName: String) {
		
		self.imageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
		
	}
	
	func set(text title: String) {
		
		self.label.text = title
		
	}
	
	func set(icon imageName: String, text title: String) {
		
		set(text: title)
		set(icon: imageName)
		
	}
	
	func applyMotion() {
		
		let min = CGFloat(-20)
		let max = CGFloat(20)
		
		let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
		xMotion.minimumRelativeValue = min
		xMotion.maximumRelativeValue = max
		
		let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
		yMotion.minimumRelativeValue = min
		yMotion.maximumRelativeValue = max
		
		let motionEffectGroup = UIMotionEffectGroup()
		motionEffectGroup.motionEffects = [xMotion,yMotion]
		
		self.addMotionEffect(motionEffectGroup)
		
	}
	
	
	
}
