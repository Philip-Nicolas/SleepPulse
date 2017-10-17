//
//  KeyboardBrightnessManager.swift
//  SleepTest
//
//  Created by Philip-Nicolas on 2017-10-17.
//  Copyright © 2017 Philip-Nicolas. All rights reserved.
//

import Foundation
import Darwin

class KeyboardBrightnessManager {
    var asleep: Bool
    var userBrightness: Float
    
    init () {
        asleep = false
        userBrightness = -1
    }
    
    func gotSleepNotif () {
        asleep = true
        userBrightness = getKeyboardBrightness()
        
        recursiveFade(i: 0)
    }
    
    func gotWakeNotif () {
        asleep = false
    }
    
    func recursiveFade (i: Float) {
        if !asleep {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + (i == 0 ? 1 : 0.065)) {
            if self.asleep {
                setKeyboardBrightness (brightness: (sin ((Float.pi * i - Float.pi) / 2) + 1) / 2)
            }
            
            self.recursiveFade (i: i < 4 - 0.1 ? i + 0.05 : 0)
        }
    }
}
