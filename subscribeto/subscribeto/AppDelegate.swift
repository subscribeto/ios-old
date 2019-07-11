//
//  AppDelegate.swift
//  subscribeto
//
//  Created by Elijah Cobb on 27/06/19.
//  Copyright © 2019 subscribeto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		User.token = "vGLHoKgcIvS8i3Wf"
		
		User.getMe(onFailure: { (err) in
			
			print(err)
			
		}, onSuccess: { (user) in
			
			print(user.id)
			
		})
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		UITabBar.appearance().backgroundColor = UIColor(red: 0.086, green: 0.098, blue: 0.145, alpha: 1.00)
		UITabBar.appearance().tintColor = UIColor(red: 0.373, green: 0.714, blue: 0.953, alpha: 1.00)
		UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.000, green: 0.141, blue: 0.282, alpha: 1.00)
		UINavigationBar.appearance().backgroundColor = UIColor(red: 0.086, green: 0.098, blue: 0.145, alpha: 1.00)
		
		return true
		
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

