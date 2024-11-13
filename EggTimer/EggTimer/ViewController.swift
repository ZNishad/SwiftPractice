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
    
    let eggTime = ["Soft": 300, "Medium": 480, "Hard": 720]
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    var totalTime: Float = 0.0
    var secondProgress: Float = 0.0
    var player: AVAudioPlayer!
    @IBOutlet weak var titleLable: UILabel!
    
    @IBAction func eggPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        secondProgress = 0.0
        progressBar.progress = 0.0
        titleLable.text = hardness
        timer.invalidate()
        totalTime = Float(eggTime[hardness]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer() {
        if secondProgress < totalTime {
            secondProgress += 1
            let procentProgress = secondProgress / totalTime
            progressBar.progress = procentProgress
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"
            playSound()
        }
    }
}
