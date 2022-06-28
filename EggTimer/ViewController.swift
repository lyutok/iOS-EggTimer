//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    // time to make egges
    let eggTimes = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle! //which button is pressed
        let totalTime = eggTimes[hardness]! //time for pressed button
        
        var secondsPassed = 0
        progressBar.progress = 0.0 //progress bar start position
        self.topLabel.text = hardness
        timer.invalidate() //after each button press current timer will be stoped
        
        //Timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            
            timer in
            if secondsPassed < totalTime {
                secondsPassed += 1
                self.progressBar.progress = Float(secondsPassed) / Float(totalTime)
                
            } else {
                
                timer.invalidate()
                self.topLabel.text = "DONE!"
                
                //play alarm
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
            }
        }
        
    }
    
}
