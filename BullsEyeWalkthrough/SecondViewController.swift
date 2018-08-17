//
//  SecondViewController.swift
//  BullsEyeWalkthrough
//
//  Created by Esteban Trevino on 8/16/18.
//  Copyright © 2018 Esteban Trevino. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeViewButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
 
}
