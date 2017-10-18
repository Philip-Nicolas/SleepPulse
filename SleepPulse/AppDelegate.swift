//
//  AppDelegate.swift
//  SleepTest
//
//  Created by Philip-Nicolas on 2017-10-16.
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
}
