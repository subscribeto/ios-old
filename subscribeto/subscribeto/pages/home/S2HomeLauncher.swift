//
//  oiuj.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

class S2HomeLauncher : UIView {
	
	var launchItemOrder: S2HomeLaunchItem!
	var launchItemSubscriptions: S2HomeLaunchItem!
	var launchItemStore: S2HomeLaunchItem!
	var launchItemSettings: S2HomeLaunchItem!
	
	func addConstraints(padding: CGFloat) {
		
		NSLayoutConstraint.activate([
			launchItemOrder.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
			launchItemOrder.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
			launchItemOrder.rightAnchor.constraint(equalTo: launchItemSubscriptions.leftAnchor, constant: -padding),
			launchItemOrder.bottomAnchor.constraint(equalTo: launchItemStore.topAnchor, constant: -padding),
			launchItemSubscriptions.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
			launchItemSubscriptions.leftAnchor.constraint(equalTo: launchItemOrder.rightAnchor, constant:padding),
			launchItemSubscriptions.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
			launchItemSubscriptions.bottomAnchor.constraint(equalTo: launchItemSettings.topAnchor, constant: -padding),
			launchItemStore.topAnchor.constraint(equalTo: launchItemOrder.bottomAnchor, constant: padding),
			launchItemStore.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
			launchItemStore.rightAnchor.constraint(equalTo: launchItemSettings.leftAnchor, constant: -padding),
			launchItemStore.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2*padding),
			launchItemSettings.topAnchor.constraint(equalTo: launchItemSubscriptions.bottomAnchor, constant: padding),
			launchItemSettings.leftAnchor.constraint(equalTo: launchItemStore.rightAnchor, constant: padding),
			launchItemSettings.rightAnchor.constraint(equalTo: self.rightAnchor, constant: padding),
			launchItemSettings.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding*2),
			launchItemOrder.widthAnchor.constraint(equalTo: launchItemSubscriptions.widthAnchor),
			launchItemOrder.widthAnchor.constraint(equalTo: launchItemStore.widthAnchor),
			launchItemOrder.widthAnchor.constraint(equalTo: launchItemSettings.widthAnchor),
			launchItemOrder.heightAnchor.constraint(equalTo: launchItemSubscriptions.heightAnchor),
			launchItemOrder.heightAnchor.constraint(equalTo: launchItemStore.heightAnchor),
			launchItemOrder.heightAnchor.constraint(equalTo: launchItemSettings.heightAnchor),
		])
		
	}
	
	func layoutLaunchItems() {
		
		launchItemOrder = S2HomeLaunchItem(text: "Order", image: "order") {
			
			
			
		}
		
		launchItemSubscriptions = S2HomeLaunchItem(text: "Subscriptions", image: "subscriptions") {
			
			
			
		}
		
		launchItemStore = S2HomeLaunchItem(text: "Store", image: "store") {
			
			let discoverVC = S2DiscoverVC()
			let navigation = S2UINavigationController(rootViewController: discoverVC)
			UIViewController.presentingViewController()?.present(navigation, animated: true, completion: nil)
			
		}
		
		launchItemSettings = S2HomeLaunchItem(text: "Settings", image: "settings") {
			
		}
		
		self.addSubviews(launchItemOrder, launchItemSubscriptions, launchItemStore, launchItemSettings)
		addConstraints(padding: 20)
		
	}
	
	override func layoutSubviews() {
		
		super.layoutSubviews()
		
		self.backgroundColor = S2UITheme.lightBackground
		layoutLaunchItems()
		
	}
	
}
