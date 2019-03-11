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
    
    
    @IBOutlet weak var minTimerLabel: UILabel!
    @IBOutlet weak var secTimerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var spaceForTextLabel: UILabel!
    
    
    @IBAction func startPressed(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: NSDate(), repeats: true)
        
        secTimerLabel.text = "0"
        minTimerLabel.text = ""
        
        startButton.isHidden = true
        stopButton.isHidden = false
        
        spaceForTextLabel.text = ""
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        
        timer.invalidate()
        
        startButton.isHidden = false
        stopButton.isHidden = true
        
    }
    
    @objc func timerUpdate () {
         let passed = -(self.timer.userInfo as! NSDate).timeIntervalSinceNow
        
        if passed < 60 {
            
            secTimerLabel.text = String(format: "\(format(value: Int(passed)))", passed)
        } else {
            
            minTimerLabel.text = String(format: " \(format(value: Int(passed/60))):", passed/60)
            secTimerLabel.text = String(format: "\(format(value: Int(passed.truncatingRemainder(dividingBy: 60))))", passed.truncatingRemainder(dividingBy: 60))
            
        }
        
        if passed >= 3600 {
            print("more than 3600")
            stopPressed(_ : true)
            spaceForTextLabel.text = """
            More than an hour has passed.
            I am tired of counting.
            Come later.
            """
        }
    }
    
    func format(value: Int) -> String {
        let extraZero = "0%.0f"
        let noZero = "%.0f"
        if value < 10 {
            return extraZero
        } else {
            return noZero
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.isHidden = false
        stopButton.isHidden = true
    }


}

