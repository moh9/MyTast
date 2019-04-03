//
//  SecondViewController.swift
//  Tast01
//
//  Created by MoHamed on 19/07/1440 AH.
//  Copyright © 1440 MOAHMMED. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func Play(_ sender: Any) {
        
         if audioStuffed == true && audioPlayer.isPlaying == false {
            audioPlayer.play()
        }
        
    }
    
    @IBAction func Pause(_ sender: Any) {
        
        if audioStuffed == true && audioPlayer.isPlaying {
                audioPlayer.pause()
            
        }
        }
        
        
    
    @IBAction func Prev(_ sender: Any) {
        
        if thisSourh != 0 && audioStuffed == true {
        playThis(thisOne: Quran[thisSourh-1])
            thisSourh -= 1
            label.text = Quran[thisSourh]
        }
        else {
            
        }
        
    }
    
    @IBAction func Next(_ sender: Any) {
        
        if thisSourh < Quran.count-1 && audioStuffed == true {
        
        playThis(thisOne: Quran[thisSourh+1])
            thisSourh += 1
            label.text = Quran[thisSourh]
        }
        else {
            
        }
    }
    
    @IBAction func Slider(_ sender: UISlider) {
        
        if audioStuffed == true {
           audioPlayer.volume = sender.value
        }
        
    }
    
    func  playThis(thisOne:String) {
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
        }
        catch {
            print("ERROR")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = Quran[thisSourh]
    }


}

