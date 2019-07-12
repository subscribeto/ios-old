//
//  MainTopView.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class MainTopView : UIView {
	
	var logoView: UIImageView
	var discoverButton: S2UIButton
	
	required init?(coder aDecoder: NSCoder) {
		
		self.logoView = UIImageView(image: UIImage(named: "iconTransparent")!)
		self.logoView.contentMode = .scaleAspectFit
		self.logoView.clipsToBounds = true
		self.logoView.translatesAutoresizingMaskIntoConstraints = false
		self.discoverButton = S2UIButton()
		self.discoverButton.translatesAutoresizingMaskIntoConstraints = false
		
		super.init(coder: aDecoder)
		
		self.discoverButton.setType(.primary)
		self.discoverButton.setTitle("Discover")
		
		self.addSubview(logoView)
		self.addSubview(discoverButton)
		
		let viewBindings = ["button": discoverButton, "image": logoView]
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[button]-10-|", options: [], metrics: nil, views: viewBindings))
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-80-[image]-80-|", options: [], metrics: nil, views: viewBindings))
		self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[image]-60-[button(40)]-20-|", options: [], metrics: nil, views: viewBindings))
		
		
	}
	
}
