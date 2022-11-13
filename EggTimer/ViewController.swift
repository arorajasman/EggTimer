//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // the code below is used to create constants for soft time, medium time and hard time for the egg
    // to boil
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    // the code below is used to create a IBAction method that will be called when one of the egg
    // button is pressed
    @IBAction func eggHardnessSelected(_ sender: UIButton) {
        
        // the code below is used to create a constant to get the hardness of the selected egg
        let hardness: String = sender.currentTitle!
        
        // the code below is used to print the title of the egg button pressed
        print("The current button pressed is: ")
        print(hardness)
        
        // if the hardness is soft then printing the soft time, else if the hardness is medium
        // then printing the medium time else if the hardness is hard then printing the hard time
        
        print("The time required to boil the egg is: ")
        
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
        
    }
    
}
