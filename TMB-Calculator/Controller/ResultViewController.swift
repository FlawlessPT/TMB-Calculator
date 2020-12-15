//
//  ResultViewController.swift
//  TMB-Calculator
//
//  Created by ISTEC on 16/07/2020.
//  Copyright © 2020 Flawless. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var tmbValue: String?
    var keepWeight: String?
    var loseWeight: String?
    var gainWeight: String?
    
    @IBOutlet weak var tmbValueLabel: UILabel!
    @IBOutlet weak var keepWeightValueLabel: UILabel!
    @IBOutlet weak var loseWeightValueLabel: UILabel!
    @IBOutlet weak var gainWeightValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadValues()
    }
    
    @IBAction func backButtonPressed(_ sender:  UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadValues() {
        tmbValueLabel.text = tmbValue
        keepWeightValueLabel.text = keepWeight
        loseWeightValueLabel.text = loseWeight
        gainWeightValueLabel.text = gainWeight
    }
}
