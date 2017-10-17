//
//  AppDelegate.swift
//  SleepTest
//
//  Created by Philip-Nicolas on 2017-10-16.
//  Copyright © 2017 Philip-Nicolas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var kbm: KeyboardBrightnessManager
    var sleepStatusObserver: SleepStatusObserver
    
    override init() {
        kbm = KeyboardBrightnessManager ()
        sleepStatusObserver = SleepStatusObserver (kbm: kbm)
    }

    func applicationDidFinishLaunching (_ aNotification: Notification) {
    }

    func applicationWillTerminate (_ aNotification: Notification) {
    }
}
