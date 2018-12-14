//
//  Comms.swift
//  test_gamepad
//
//  Created by Vattikuti, Shashaank (NIH/NIDDK) [E] on 12/14/18.
//  Copyright © 2018 svattiku. All rights reserved.
//

//define some communication (gamepad) properties in class

//import Foundation

class Comms{
    var commL: Int = 0 {
        willSet(newValue) {
            print("About to set commL to \(newValue)")
        }
        didSet {
            print("Set commL to \(commL)")
        }
        }
    var commR: Int = 0 {
        willSet(newValue) {
            print("About to set commR to \(newValue)")
        }
        didSet {
            print("Set commR to \(commR)")
        }
    }
    }
