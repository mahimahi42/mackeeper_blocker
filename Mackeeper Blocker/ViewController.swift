//
//  ViewController.swift
//  Mackeeper Blocker
//
//  Created by Bryce Davis on 8/13/15.
//  Copyright (c) 2015 Bryce Davis. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    /// The path to the mackeeper_blocker.sh script
    var path:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: Actions
    
    @IBAction func blockMackeeper(sender: AnyObject) {
        Blocker.blockMackeeper()
    }

}

