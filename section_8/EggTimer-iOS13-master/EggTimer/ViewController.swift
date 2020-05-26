//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let eggTime = ["Soft": 5,"Medium": 7,"Hard": 12]  // Minutes
        let totalTime = (60 * eggTime[sender.currentTitle!]!)
        var secondsPassed = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {(Timer) in
             if secondsPassed < totalTime {
                secondsPassed += 1
                print(Float((secondsPassed / totalTime) * 100))
                self.progressBar.progress = Float((secondsPassed / totalTime) * 100)
             }
            else{
                self.timer.invalidate()
                self.bannerLabel.text = "DONE!"
            }
         }
        
    }
}
