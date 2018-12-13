//
//  ViewController.swift
//  test_gameloop
//
//  Created by svattiku on 12/5/18.
//  Copyright © 2018 svattiku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var t0 : Double = Date().timeIntervalSinceReferenceDate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //option 1: displaylink, only works for integer rates
//        let displayLink = CADisplayLink(target: self, selector: #selector(update))
//        displayLink.preferredFramesPerSecond = 1
//        displayLink.add(to: .main, forMode: .commonModes)
        //option 2: scheduledTimer works for whatever interval
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        print(Date().timeIntervalSinceReferenceDate-t0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

