//
//  ViewController.swift
//  BullsEyeWalkthrough
//
//  Created by Esteban Trevino on 8/15/18.
//  Copyright © 2018 Esteban Trevino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //class variables
    var currentValue : Int = 0
    var targetValue : Int = 0
    var score = 0
    var rounds = 0
    
    //class IBOutlet variables
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        scoreLabel.text = String(score)
        startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftImageResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImageResizeable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightImageResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImageResizeable, for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        score += points
        
        
        let title : String
        if difference == 0{
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            points += 50
        }else if difference < 10 {
            title = "Pretty Good"
        } else{
            title = "Not even close..."
        }
      
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        rounds += 1
        targetValue = Int(arc4random_uniform(99) + 1)
        currentValue = 0
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetNumberLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundsLabel.text = String(rounds)
    }
    @IBAction func startOver(){
        
        let alert = UIAlertController(title: "Start Over", message: "Are you sure? All of your progress will reset.", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.rounds = 0
            self.score = 0
            self.startNewRound()
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func secondPageButton(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondView", sender: self)
    }
    
}

