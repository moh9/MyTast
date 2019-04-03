//
//  FirstViewController.swift
//  Tast01
//
//  Created by MoHamed on 19/07/1440 AH.
//  Copyright © 1440 MOAHMMED. All rights reserved.
//

import UIKit
import AVFoundation

var Quran:[String] = []
var audioPlayer = AVAudioPlayer()
var thisSourh = 0
var audioStuffed = false


class FirstViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var MyTabeView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Quran.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = Quran[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let audioPath = Bundle.main.path(forResource: Quran[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSourh = indexPath.row
            audioStuffed = true
        }
        catch {
            print("ERROR")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gettQuranSurah()
        _ = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
    }
    
    func gettQuranSurah() {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do {
            let SourhPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil , options: .skipsHiddenFiles)
            for Sourh in SourhPath {
                var mySourh = Sourh.absoluteString
                if mySourh.contains(".mp3") {
                    let findString = mySourh.components(separatedBy: "/")
                    mySourh = findString[findString.count-1]
                    mySourh = mySourh.replacingOccurrences(of: "%20", with: " ")
                    mySourh = mySourh.replacingOccurrences(of: ".mp3", with: "")
                    Quran.append(mySourh)
                    print(mySourh)
                }
            }
            MyTabeView.reloadData()
        }
        catch {
            
        }
    }

}

