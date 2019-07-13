//
//  ouij.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit


class S2HomeDashboard : UIView {
	
	var logoImage: UIImageView!
	var logoText: UILabel!
	var discoverButton: S2UIButton!
	
	func applyConstraints(padding: CGFloat) {
		
		NSLayoutConstraint.activate([
			logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: padding + 60),
			logoImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
			logoImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
			logoImage.bottomAnchor.constraint(equalTo: logoText.topAnchor, constant: -padding/2),
			logoText.bottomAnchor.constraint(equalTo: discoverButton.topAnchor, constant: -padding * 2),
			logoText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
			logoText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
			logoText.heightAnchor.constraint(equalToConstant: 48),
			discoverButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding * 4),
			discoverButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding * 4),
			discoverButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding * 2),
			discoverButton.heightAnchor.constraint(equalToConstant: 60),
		])
		
	}
	
	override func layoutSubviews() {
		
		super.layoutSubviews()
		
		self.backgroundColor = S2UITheme.darkBackground
		
		logoImage = UIImageView(image: UIImage(named: "iconTransparent"))
		logoImage.contentMode = .scaleAspectFit
		logoImage.useAutoLayout()
		
		logoText = UILabel()
		logoText.text = "sub.scribe.to"
		logoText.textAlignment = .center
		logoText.textColor = S2UITheme.white
		logoText.font = UIFont.systemFont(ofSize: 48, weight: .bold)
		logoText.useAutoLayout()
		
		discoverButton = S2UIButton(text: "Discover") {
			
			print("Clicked launch item: Discover.")
			let alert = UIAlertController(title: "Clicked 'Discover'", message: nil, preferredStyle: .alert)
			alert.addAction(UIAlertAction.init(title: "Done", style: .default, handler: nil))
			UIViewController.presentingViewController()?.present(alert, animated: true, completion: nil)
			
		}
		discoverButton.useAutoLayout()
		
		self.addSubviews(logoImage, logoText, discoverButton)
		
		applyConstraints(padding: 20)
		
	}
	
}
