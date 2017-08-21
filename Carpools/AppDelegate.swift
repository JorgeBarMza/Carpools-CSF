//
//  AppDelegate.swift
//  Carpools
//
//  Created by Jorge on 11/11/16.
//  Copyright © 2016 Jorge. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    override init() {
        super.init()
        FIRApp.configure()
    }
}
