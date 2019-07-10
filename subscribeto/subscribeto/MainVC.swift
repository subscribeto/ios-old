//
//  MainVC.swift
//  subscribeto
//
//  Created by Elijah Cobb on 9/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit
import MapKit
import PromiseKit
import AwaitKit

class MainVC: UIViewController {
	
	@IBOutlet var topMap: MKMapView!
	@IBOutlet var topLeftContainer: UIView!
	@IBOutlet var topRightContainer: UIView!
	@IBOutlet var bottomLeftContainer: UIView!
	@IBOutlet var bottomRightContainer: UIView!
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		topLeftContainer.layer.cornerRadius = 10
		topRightContainer.layer.cornerRadius = 10
		bottomLeftContainer.layer.cornerRadius = 10
		bottomRightContainer.layer.cornerRadius = 10
		
		topLeftContainer.backgroundColor = UIColor.subscribeto.blue2
		topRightContainer.backgroundColor = UIColor.subscribeto.blue2
		bottomLeftContainer.backgroundColor = UIColor.subscribeto.blue2
		bottomRightContainer.backgroundColor = UIColor.subscribeto.blue2
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		super.viewDidAppear(animated)
		
		async {
			try await(API.signUp(email: "elijah", password: "alpine"))
		}
		
	}
	
}

