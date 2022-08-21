//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
//import AVFoundation

class ViewController: UIViewController {
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var TotalTime = 0
    var secondsPassed = 0
   
//    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
//        playSound(sounName: sender.currentTitle!)
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        TotalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
        
    @objc func updateTimer(){
        if secondsPassed < TotalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(TotalTime)
            
        
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
//    func playSound(sounName: String) {
//        let url = Bundle.main.url(forResource: sounName, withExtension: "alarm_sound")
//        player = try! AVAudioPlayer(contentsOf: url!)
//        player.play()
//
    }

