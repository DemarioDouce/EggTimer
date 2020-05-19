//
//  ViewController.swift
//  Egg Timer
//
//  Created by Demario Douce on 2020-05-16.
//  Copyright © 2020 Demario Douce. All rights reserved.
//

import UIKit

//Sound play lib
import AVFoundation

class ViewController: UIViewController {
    
    //UI Elements  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //const dictionary
    let eggTimes = ["SOFT": 3, "MEDIUM": 4, "HARD": 7]
    
    //timer variable was init
    var timer = Timer()
    
    //player variable was init 
    var player: AVAudioPlayer!
    
    //Time now 
    var totalTime = 0
    
    //Time gone
    var secondsPassed = 0
    
    
    //button selection
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //Reset timer
        timer.invalidate()
        
        //Pass the title of button to variable 
        let hardness = sender.currentTitle!
        
        //Get the time value from the dictionary base off the key  
        totalTime = eggTimes[hardness]!
        
        //Set progress bar to 0
        progressBar.progress = 0.0
        
        //Set time pass to 0
        secondsPassed = 0
        
        //Set text to value of the button selected 
        titleLabel.text = hardness
        
        //Timer 
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    
    //Function that ius pass within timer  
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
            //Play sound
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
    
}

