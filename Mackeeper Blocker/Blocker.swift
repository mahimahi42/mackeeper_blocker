//
//  Blocker.swift
//  Mackeeper Blocker
//
//  Created by Bryce Davis on 8/15/15.
//  Copyright © 2015 Bryce Davis. All rights reserved.
//

import Foundation

struct Blocker {
    
    static func blockMackeeper() {
        // Unwrap our path. It should always been found.
        if let path = getScriptPath() {
            
            /**
            Spawn a new NSTask to execute our script. Commands of the form:
              /usr/bin/open -a Terminal.app script_name
            will spawn a new Terminal and execute the script.
            */
            let task = NSTask()
            task.launchPath = "/usr/bin/open"
            task.arguments = ["-a", "Terminal.app", path]
            
            // Most users won't see the output, but it's caught here...
            let pipe = NSPipe()
            task.standardOutput = pipe
            task.launch()
            
            // ...and output here. This is mostly for debugging.
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            let output = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            print(output!)
        }
    }
    
    
    // MARK: Private functions
    
    /**
    loadScript() will grab the included mackeeper_blocker.sh script and return
    the path as an Optional String.
    
    - returns: The path to the mackeeper_blocker script
    */
    private static func getScriptPath() -> String? {
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("mackeeper_blocker", ofType: "sh")
        
        return path
    }
}