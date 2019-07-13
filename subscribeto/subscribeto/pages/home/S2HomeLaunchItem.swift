//
//  S2HomeLaunchItemn.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2HomeLaunchItem : S2UIView, S2UIClickAnimator {
	
	let label: UILabel!
	let icon: UIImageView!
	let clickManager: S2UIClickManager
	let onClick: () -> Void
	
	required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	init(text: String, image: String, onClick : @escaping () -> Void) {
		
		let label = UILabel()
		label.text = text
		self.label = label
		self.icon = UIImageView(image: UIImage(named: image)?.withRenderingMode(.alwaysTemplate))
		self.clickManager = S2UIClickManager()
		self.onClick = onClick
		
		super.init()
		
		self.clickManager.start(delegate: self)
		self.useAutoLayout()
		
	}
	
	func applyConstraints(padding: CGFloat) {
		
		NSLayoutConstraint.activate([
			label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
			label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
			label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
			label.heightAnchor.constraint(equalToConstant: 20),
			icon.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
			icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
			icon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
			icon.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -padding),
		])
		
	}
	
	override func layoutSubviews() {
		
		self.backgroundColor = S2UITheme.primary
		self.layer.cornerRadius = 10
		
		label.useAutoLayout()
		icon.useAutoLayout()
		
		icon.contentMode = .scaleAspectFit
		icon.tintColor = S2UITheme.white
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: label.font.pointSize, weight: .bold)
		label.textColor = S2UITheme.white
		
		self.addSubviews(label, icon)
		
		applyConstraints(padding: 10)
		
		
	}
	
	func clicked() {
		
		self.onClick()
		
	}

	
}
