//
//  Observer.swift
//  SleepTest
//
//  Created by Philip-Nicolas on 2017-10-17.
//  Copyright © 2017 Philip-Nicolas. All rights reserved.
//

import Cocoa

class SleepStatusObserver {
    var kbm :  KeyboardBrightnessManager
    
    init (kbm: KeyboardBrightnessManager) {
        self.kbm = kbm
        
        NSWorkspace.shared.notificationCenter.addObserver (forName: NSWorkspace.screensDidSleepNotification, object: nil, queue: nil, using: displaySlept)
        NSWorkspace.shared.notificationCenter.addObserver (forName: NSWorkspace.screensDidWakeNotification, object: nil, queue: nil, using: displayWokeUp)
    }
    
    deinit {
        NSWorkspace.shared.notificationCenter.removeObserver (self)
    }
    
    func displaySlept (_: Notification) {
        kbm.gotSleepNotif()
    }
    
    func displayWokeUp (_: Notification) {
        kbm.gotWakeNotif()
    }
}
