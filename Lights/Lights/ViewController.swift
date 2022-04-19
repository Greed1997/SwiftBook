//
//  ViewController.swift
//  Lights
//
//  Created by Александр on 14.04.2022.
//

import UIKit

enum CurrentlyLight {
    case red, yellow, green
}
class ViewController: UIViewController {

    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    var currentlyLight = CurrentlyLight.red
    let lightOn = 1.0
    let lightOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = lightOff
        yellowLight.alpha = lightOff
        greenLight.alpha = lightOff
        
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        switch currentlyLight {
        case .red:
            greenLight.alpha = lightOff
            redLight.alpha = lightOn
            currentlyLight = .yellow
        case .yellow:
            redLight.alpha = lightOff
            yellowLight.alpha = lightOn
            currentlyLight = .green
        case .green:
            yellowLight.alpha = lightOff
            greenLight.alpha = lightOn
            currentlyLight = .red
        }
    }
}

