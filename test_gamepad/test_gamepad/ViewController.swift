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
   
    var pstate:Int = -100
    let comms = Comms()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //start controller observers
        self.setUpControllerObservers()
        //start splash screen
        UIScreen.main.brightness = CGFloat(0.5)
        self.splashscreen0comm()
        
        

    }
    
    func splashscreen0comm(){
        self.view.backgroundColor = UIColor(red: 178/255, green: 0, blue: 0, alpha: 1)
    }

    func splashscreen1comm(){
        self.view.backgroundColor = UIColor(red: 178/255, green: 178/255, blue: 0, alpha: 1)
    }

    func splashscreen2comm(){
        self.view.backgroundColor = UIColor(red: 0, green: 178/255, blue: 0, alpha: 1)
    }

    func setUpControllerObservers(){
        NotificationCenter.default.addObserver(self,selector: #selector(self.connectControllers), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.controllerDisconnected), name: NSNotification.Name.GCControllerDidDisconnect, object: nil)
    }

   @objc func controllerDisconnected(){
//        self.paused=true
        print("disconnected")
    self.splashscreen0comm()
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
            if (gamepad.leftShoulder == element){
                if (gamepad.leftShoulder.isPressed == true) && (self.pstate != 1){
                    print("leftShoulder pressed")
                    self.pstate = 1
                    if self.comms.commL == 0{
                        self.comms.commL = 1
                        if self.comms.commR == 1{
                            self.splashscreen2comm()
                        }
                        else {
                            self.splashscreen1comm()
                        }
                    }
                } else if ( gamepad.leftShoulder.isPressed == false) {
                    print("leftShoulder released")
                    self.pstate = -100
                }
            }
            if (gamepad.rightShoulder == element){
                if (gamepad.rightShoulder.isPressed == true) && (self.pstate != -1){
                    print("rightShoulder pressed")
                    self.pstate = -1
                    if self.comms.commR == 0{
                        self.comms.commR = 1
                        if self.comms.commL == 1{
                            self.splashscreen2comm()
                        }
                        else {
                            self.splashscreen1comm()
                        }
                    }
                } else if ( gamepad.rightShoulder.isPressed == false) {
                    print("rightShoulder released")
                    self.pstate = -100
                }
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



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

//            else if (gamepad.leftTrigger == element){
//                if ( gamepad.leftTrigger.isPressed == true){
//                    print("leftTrigger pressed")
//                } else if ( gamepad.leftTrigger.isPressed == false) {
//                    print("leftTrigger released")
//                }
//            }
//            else

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
