//
//  ViewController.swift
//  test_keyboard
//
//  Created by svattiku on 12/1/18.
//  Copyright © 2018 svattiku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: UIKeyInputLeftArrow, modifierFlags: [], action: #selector(ViewController.LeftArrowPress)),
//            UIKeyCommand(input: UIKeyInputUpArrow, modifierFlags: [], action: #selector(ViewController.LeftArrowPress)),
            UIKeyCommand(input: UIKeyInputRightArrow, modifierFlags: [], action: #selector(ViewController.RightArrowPress))]
    }
    
    @objc func LeftArrowPress(sender: UIKeyCommand) {
//        if running {
            print("Left")
            data.append( ("Left", Date().timeIntervalSinceReferenceDate) )
//        print(data)
      
      
        
    }

    
    
    @objc func RightArrowPress(sender: UIKeyCommand) {
        //        if running {
        print("Right")
                    data.append( ("Right", Date().timeIntervalSinceReferenceDate) )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

