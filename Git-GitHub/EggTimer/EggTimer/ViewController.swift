//
//  ViewController.swift
//  EggTimer
//
//  Created by Disha Limbani on 2023-05-16.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?
class ViewController: UIViewController {

    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = [ "Soft" : 3 , "Medium" : 5 , "Hard" : 7]
   
    var valueTime: Float = 0.00
    var endValue : Float = 0.00
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func onClickAnyButton(_ sender: UIButton) {
        let hardness = sender.titleLabel?.text
        timer.invalidate()
        progressBar.progress = 0
        endValue = 0.00
        lblTitle.text = hardness
        valueTime = Float(eggTime[hardness!]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func countDown(){
       
       if endValue < valueTime {
           endValue += 1
           let sum = endValue / valueTime
           progressBar.progress = sum
           print(Float(sum))
           print("...")
            
       }else {
           timer.invalidate()
           playVoice(name: "alarm_sound")
           lblTitle.text = "Done!"
          
       }
        
    }
    //Play Alarm 
    func playVoice(name : String){
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}

