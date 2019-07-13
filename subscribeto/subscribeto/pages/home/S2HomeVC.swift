//
//  S2HomeVC.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © padding19 subscribeto. All rights reserved.
//

import UIKit

class S2HomeVC : UIViewController {
	
	// The percentage of height the bottom takes up compared to the top.
	let containerRatio: CGFloat = 0.75
	
	var stackView: UIStackView!
	var topContainer: S2HomeTopContainer!
	var bottomContainer: S2HomeLauncher!
	
	override func loadView() {
		
		super.loadView()
		
		stackView = UIStackView(frame: .zero)
		topContainer = S2HomeTopContainer(frame: .zero)
		bottomContainer = S2HomeLauncher(frame: .zero)
		
		stackView.useAutoLayout()
		topContainer.useAutoLayout()
		bottomContainer.useAutoLayout()
		
		view.addSubview(stackView)
		stackView.addArrangedSubview(topContainer)
		stackView.addArrangedSubview(bottomContainer)
		stackView.axis = .vertical
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
			stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
			stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			bottomContainer.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: containerRatio),
			topContainer.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor)
		])
		
		
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
	}
	
}
