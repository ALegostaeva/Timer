//
//  ViewController.swift
//  Timer
//
//  Created by Александра Легостаева on 04/03/2019.
//  Copyright © 2019 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    @IBAction func startPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: NSDate(), repeats: true)
        
        startButton.isHidden = true
        stopButton.isHidden = false
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        timer.invalidate()
        
        startButton.isHidden = false
        stopButton.isHidden = true
    }
    
    @objc func timerUpdate () {
        let passed = -(self.timer.userInfo as! NSDate).timeIntervalSinceNow
        
        if passed < 60 {
            timerLabel.text = String(format: "%.0f", passed)
        } else {
            timerLabel.text = String(format: "%.0f : %.0f", passed/60, passed.truncatingRemainder(dividingBy: 60))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.isHidden = false
        stopButton.isHidden = true
    }


}

