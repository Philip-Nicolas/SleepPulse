//
//  KeyboardFunctions.swift
//  SleepTest
//
//  Created by Philip-Nicolas on 2017-10-17.
//

import Foundation

// Takes a command with arguments, and returns the result as a string
func executeCommandWithResult (command: String, args: [String]) -> String {
    let process = Process ()
    
    process.launchPath = command
    process.arguments = args
    
    let pipe = Pipe ()
    process.standardOutput = pipe
    process.launch ()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile ()
    let output: String = NSString (data: data, encoding: String.Encoding.utf8.rawValue)! as String
    
    return output
}

// Take a command with arguments, and run it
func executeCommand (command: String, args: [String]) {
    let process = Process ()
    
    process.launchPath = command
    process.arguments = args
    
    process.launch ()
}

func setKeyboardBrightness (brightness: Float) {
    executeCommand(command: "/bin/bash", args: ["-c", Bundle.main.path(forResource: "kbrightness", ofType: nil)! + " " + String (brightness)])
}

func getKeyboardBrightness () -> Float {
    return Float (executeCommandWithResult(command: "/bin/bash", args: ["-c", Bundle.main.path(forResource: "kbrightness", ofType: nil)!]))!
}
