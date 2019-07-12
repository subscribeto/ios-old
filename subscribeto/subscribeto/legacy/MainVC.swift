//
//  MainVC.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit
import MapKit

class MainVC: UIViewController {
	
	@IBOutlet var topMap: MKMapView!
	@IBOutlet var topContainer: MainTopView!
	@IBOutlet var topLeftContainer: LauncherButton!
	@IBOutlet var topRightContainer: LauncherButton!
	@IBOutlet var bottomLeftContainer: LauncherButton!
	@IBOutlet var bottomRightContainer: LauncherButton!
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
	
		topLeftContainer.onClick { self.segueToViewController("topLeftVC") }
		topRightContainer.onClick { self.segueToViewController("topRightVC") }
		bottomLeftContainer.onClick { self.segueToViewController("bottomLeftVC") }
		bottomRightContainer.onClick { self.segueToViewController("bottomRightVC") }
		
		topLeftContainer.set(icon: "order.png", text: "Order")
		topRightContainer.set(icon: "subscriptions.png", text: "Subscriptions")
		bottomLeftContainer.set(icon: "store.png", text: "Store")
		bottomRightContainer.set(icon: "settings.png", text: "Settings")
		topContainer.backgroundColor = UIColor.init(white: 1, alpha: 0.75)
		
		let zoom = 1000
		let region = MKCoordinateRegion(center: Location.coordinate, latitudinalMeters: CLLocationDistance(exactly: zoom)!, longitudinalMeters: CLLocationDistance(exactly: zoom)!)
		topMap.setRegion(topMap.regionThatFits(region), animated: true)
		topMap.showsUserLocation = true
		topMap.mapType = .hybrid
	
	}
	
	func segueToViewController(_ id: String) {
		let viewController = self.storyboard!.instantiateViewController(withIdentifier: id)
		self.present(viewController, animated: true, completion: nil)
	}
	
}
