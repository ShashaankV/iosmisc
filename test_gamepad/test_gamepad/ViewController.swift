//
//  ViewController.swift
//  test_gamepad
//
//  Created by svattiku on 12/10/18.
//  Copyright © 2018 svattiku. All rights reserved.
//ref: https://www.bignerdranch.com/blog/tvos-games-part-1-using-the-game-controller-framework/

import UIKit
import GameController

class ViewController: UIViewController {
   

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        print(GCController.startWirelessControllerDiscovery(completionHandler:nil))
//
//        print(GCController.controllers().count)
        self.startWatchingForControllers()
        
//        print(GCController.controllers().count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func startWatchingForControllers() {
        // Subscribe for the notes
        let ctr = NotificationCenter.default
        ctr.addObserver(forName: .GCControllerDidConnect, object: nil, queue: .main) { note in
            if let ctrl = note.object as? GCController {
                self.add(ctrl)
                print("connected")
                print(GCController.controllers().count)
            }
        }
        ctr.addObserver(forName: .GCControllerDidDisconnect, object: nil, queue: .main) { note in
            if let ctrl = note.object as? GCController {
//                self.remove(ctrl)
                print("disconnected")
            }
        }
        // and kick off discovery
//        GCController.startWirelessControllerDiscovery(completionHandler: {})
    }
    
    func add(_ controller: GCController) {
        let name = String(describing:controller.vendorName)
        if let gamepad = controller.extendedGamepad {
            print("connect extended \(name)")
        } else if let gamepad = controller.microGamepad {
            print("connect micro \(name)")
        } else {
            print("Huh? \(name)")
        }
    }
    
}

