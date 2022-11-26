//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
// importing AVFoundation to play sound
import AVFoundation


class ViewController: UIViewController {
    
    // the code below is used to create constants for soft time, medium time and hard time for the egg
    // to boil
    // let softTime = 5
    // let mediumTime = 7
    // let hardTime = 12
    
    // creating a dictionary for storing the time for boiling the eggs along with the hardness type in
    // the form of key value pairs
    
    // the dictionary below stores the data with keys of type String and values of type Int
    
    // the time is in seconds
    let eggBoilTimes: [String : Int] = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
    
    // the variable below is used to get the timer value
    // var secondsTime = 60
    
    // the code below is used to create an instance of timer
    var timer = Timer()
    
    // label text to show the heading to the user
    @IBOutlet weak var labelText: UILabel!
    
    // variable to show the progress of time to boil the eggs
    @IBOutlet weak var boilEggTimerProgressView: UIProgressView!
    
    // the variable below is used to get the total timer
    var totalTime: Int = 0
    
    // the variable below is used to get the value of seconds passed
    var secondsPassed: Int = 0
    
    // creating an instance of AVAudioPlayer to play sound
    var alarmSoundPlayer: AVAudioPlayer?
    
    // using the viewDidLoad() method here for initializing the timer object for countdown timer
    override func viewDidLoad() {
        // the code below is used to create the countdown timer
        // let timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateCountTimer), userInfo: nil, repeats: true)
        
    }
    
    // the code below is used to create a IBAction method that will be called when one of the egg
    // button is pressed
    @IBAction func eggHardnessSelected(_ sender: UIButton) {
        
        // using the invalidate() method from the timer instance to invalidate the current scheduled
        // timer that is currently running when the button is pressed
        
        // stopping the current timer
        timer.invalidate()
        
        // the code below is used to create a constant to get the hardness of the selected egg
        let hardness: String = sender.currentTitle!
        
        // the code below is used to print the title of the egg button pressed
        print("The current button pressed is: ")
        print(hardness)
        
        // if the hardness is soft then printing the soft time, else if the hardness is medium
        // then printing the medium time else if the hardness is hard then printing the hard time
        
        print("The time required to boil the egg is: ")
        
       // if hardness == "Soft" {
       //     print(softTime)
       // } else if hardness == "Medium" {
       //     print(mediumTime)
       // } else {
       //     print(hardTime)
       // }
        
        
        // the code below is used to print the time required to boil the egg based on the hardness
        // selected by the user and then getting the value of time according to the hardness from the
        // eggBoilTimes dictionary created above
        
        // the code below is used to check that if the value of eggBoilTimes[hardness] is not nil
        // then printing that value to the console
        if eggBoilTimes[hardness] != nil {
            print(eggBoilTimes[hardness]!)
            
            // setting the value of secondsTimer variable to the value of timer required to boil the eggs
            // secondsTime = eggBoilTimes[hardness]!
            
            // the property below is used to set the value of totalTime here based on the hardness of the
            //  egg
            totalTime = eggBoilTimes[hardness]!
            
            // the code below is used to start the timer from 60 seconds
            
            // the code below is used to create the countdown timer
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountTimer), userInfo: nil, repeats: true)
            
            // the code below is used to set the progress value of the progressBar to 0 when the
            // user selects any one of the egg
            boilEggTimerProgressView.progress = 0.0
            
            // the code below is used to set the value of secondsPassed to 0 when the user selects
            // any oner of the egg
            secondsPassed = 0
            
            // the code below is used to set the value of labelText to the type of hardness selected
            // by the user
            labelText.text = hardness
        }
        
        // setting the value of progress property from progress view to 1.0 when the button
        // is pressed
        
        // the value of progress lies between 0.0 and 1.0
        // boilEggTimerProgressView.progress = 1.0 // here 1.0 == 100%
        
    }
    
    // the method below is used to decrease the value of counter for taking the countdown timer from
    // 60 to 1
    @objc func updateCountTimer() -> Void {
//        if secondsTime > 0 {
//            // printing the counter value to the console
//            print("Seconds Left: \(secondsTime)")
//            secondsTime -= 1
//        } else {
//            // invalidating or stopping the current timer
//            timer.invalidate()
//            // changing the value of text in the labelText to done
//            labelText.text = "Done!".uppercased()
//        }
        
        
        // the code below is used to check that if the seconds passed is less then totalTime then increase
        // the value of secondsPassed by 1 else show the done text in the label
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            
            // creating a variable to get the percentageProgress for showing the updates in the progress bar
            let percentageProgress: Float = Float(secondsPassed) / Float(totalTime)
            
            // the below line of code is for debugging purpose
            print("The value of percentage progress is: \(percentageProgress)")
            
            // the code below is used to set the progress property of the progress bar
            boilEggTimerProgressView.progress = percentageProgress
            
            // the below line of code is for debugging purpose
            print("The value inside the progress is: \(percentageProgress)")
            
        } else {
            // invalidating or stopping the current timer
            timer.invalidate()
            // changing the value of text in the labelText to done
            labelText.text = "Done!".uppercased()
            // calling the playSound() method to play alarm_sound when the progress is complete
            playSound()
        }
                    
    }
    
    
    // the method below is used to play the alarm sound
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            alarmSoundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = alarmSoundPlayer else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}
