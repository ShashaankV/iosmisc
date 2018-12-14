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
   
    var pstate:String!
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        print(GCController.startWirelessControllerDiscovery(completionHandler:nil))
//        self.startWatchingForControllers()

        self.setUpControllerObservers()

    }
    
    func setUpControllerObservers(){
        NotificationCenter.default.addObserver(self,selector: #selector(self.connectControllers), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.controllerDisconnected), name: NSNotification.Name.GCControllerDidDisconnect, object: nil)
    }
    
   @objc func controllerDisconnected(){
//        self.paused=true
        print("disconnected")
    }
    
   @objc func connectControllers(controller:GCController){
//        self.paused = false
        for controller in GCController.controllers() {
            if (controller.extendedGamepad != nil ) {
                controller.extendedGamepad?.valueChangedHandler = nil
                self.setUpExtendedController(controller:controller)
                print("connected")

            }
        }
    }
    
    func setUpExtendedController(controller:GCController) {
        controller.extendedGamepad?.valueChangedHandler = {
            (gamepad: GCExtendedGamepad, element:GCControllerElement) in
            //            if (gamepad.leftThumbstick == element) {
//                if (gamepad.leftThumbstick.left.value > 0.2) {
//                    print("pressed leftThumbstick left")
//                } else if (gamepad.leftThumbstick.left.isPressed == false) {
//                    print ("left go of leftThumbstick left")
//                }
//            } else if (gamepad.rightThumbstick == element) {
//                if (gamepad.rightThumbstick.right.value > 0.2) {
//                    print("pressed rightThumbstick right")
//                } else if (gamepad.rightThumbstick.right.isPressed == false) {
//                    print ("left go of rightThumbstick right")
//                }
//            } else if (gamepad.dpad == element) {
//                if (gamepad.dpad.right.isPressed == true){
//                    print("pressed dpad right")
//                } else if (gamepad.dpad.right.isPressed == false){
//                    print("let go of dpad right")
//                }
//                if (gamepad.dpad.left.isPressed == true){
//                    print("pressed dpad left")
//                } else if (gamepad.dpad.left.isPressed == false){
//                    print("let go of dpad left")
//                }
//            } else
        if (gamepad.leftShoulder == element){
                if (gamepad.leftShoulder.isPressed == true) && (self.pstate != "left"){
                    print("leftShoulder pressed")
                    self.pstate = "left"
                } else if ( gamepad.leftShoulder.isPressed == false) {
                    print("leftShoulder released")
                    self.pstate = nil
                }
            }
//            else if (gamepad.leftTrigger == element){
//                if ( gamepad.leftTrigger.isPressed == true){
//                    print("leftTrigger pressed")
//                } else if ( gamepad.leftTrigger.isPressed == false) {
//                    print("leftTrigger released")
//                }
//            }
//            else
            if (gamepad.rightShoulder == element){
                if (gamepad.rightShoulder.isPressed == true) && (self.pstate != "right"){
                    print("rightShoulder pressed")
                    self.pstate = "right"
                } else if ( gamepad.rightShoulder.isPressed == false) {
                    print("rightShoulder released")
                    self.pstate = nil
                }
            }
//            else if (gamepad.rightTrigger == element){
//                if ( gamepad.rightTrigger.isPressed == true){
//                    print("rightTrigger pressed")
//                } else if ( gamepad.rightTrigger.isPressed == false) {
//                    print("rightTrigger released")
//                }
//            } else if ( gamepad.buttonA == element) {
//                if ( gamepad.buttonA.isPressed == true){
//                    print("buttonA pressed")
//                } else if ( gamepad.buttonA.isPressed == false) {
//                    print("buttonA released")
//                }
//            } else if ( gamepad.buttonY == element) {
//                if ( gamepad.buttonY.isPressed == true){
//                    print("buttonY pressed")
//                } else if ( gamepad.buttonY.isPressed == false) {
//                    print("buttonY released")
//                }
//            } else if ( gamepad.buttonB == element) {
//                if ( gamepad.buttonB.isPressed == true){
//                    print("buttonB pressed")
//                } else if ( gamepad.buttonB.isPressed == false) {
//                    print("buttonB released")
//                }
//            } else if ( gamepad.buttonX == element) {
//                if ( gamepad.buttonX.isPressed == true){
//                    print("buttonX pressed")
//                } else if ( gamepad.buttonX.isPressed == false) {
//                    print("buttonX released")
//                }
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//
//    func startWatchingForControllers() {
//        // Subscribe for the notes
//        let ctr = NotificationCenter.default
//        ctr.addObserver(forName: .GCControllerDidConnect, object: nil, queue: .main) { note in
//            if let ctrl = note.object as? GCController {
//                self.add(ctrl)
//                print("connected")
//                print(GCController.controllers().count)
//            }
//        }
//        ctr.addObserver(forName: .GCControllerDidDisconnect, object: nil, queue: .main) { note in
//            if let ctrl = note.object as? GCController {
////                self.remove(ctrl)
//                print("disconnected")
//            }
//        }
//        // and kick off discovery
////        GCController.startWirelessControllerDiscovery(completionHandler: {})
//    }
//
//    func add(_ controller: GCController) {
//        let name = String(describing:controller.vendorName)
//        if let gamepad = controller.extendedGamepad {
//            print("connect extended \(name)")
//        } else if let gamepad = controller.microGamepad {
//            print("connect micro \(name)")
//        } else {
//            print("Huh? \(name)")
//        }
//    }
    
}

