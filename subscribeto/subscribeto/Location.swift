//
//  Location.swift
//  subscribeto
//
//  Created by Elijah Cobb on 12/07/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import Foundation
import CoreLocation

class Location : NSObject, CLLocationManagerDelegate {
	
	static let sharedInstance = Location()
	
	static var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 44.763058, longitude: -85.620628)
	
	var locationManager: CLLocationManager?

	func startLocationManager() {
		NSLog("Start UpdatedManagerLocation")
		if locationManager == nil {
			NSLog("Initialize location Manager")
			locationManager = CLLocationManager()
			if let manager = locationManager {
				print("Manager Initialized")
				manager.desiredAccuracy = kCLLocationAccuracyBest
				manager.distanceFilter = 5.0
				manager.activityType = .fitness
				manager.pausesLocationUpdatesAutomatically = false
				manager.delegate = self
				manager.requestWhenInUseAuthorization()
				manager.startUpdatingLocation()
			} else {
				print("Location manager failed to initialize.")
			}
		}
		self.locationManager?.startUpdatingLocation()
	}
	
	func stopLocationManager() {
		NSLog("Stop LocationUpdatedManager")
		self.locationManager?.stopUpdatingLocation()
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		if let coordinate = locations.last?.coordinate { Location.coordinate = coordinate }
		
	}
	
	private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
		// I recommend you to send a NSNotificationCenter to detect if the user changes it in the settings so that you can handle it
		print("Location status changed:", status)
	}
	
	private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
		print("Location Error:", error)
	}
	
}
