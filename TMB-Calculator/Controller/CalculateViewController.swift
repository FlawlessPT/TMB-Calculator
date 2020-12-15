//
//  CalculateViewController.swift
//  TMB-Calculator
//
//  Created by Flawless on 16/07/2020.
//  Copyright © 2020 Flawless. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tmbManager = TMBManager()
    
    let genders:[String] = ["Masculino", "Feminino"]
    let activityLevels:[String] = ["Sedentário", "Levemente Ativo", "Moderadamente Ativo", "Altamente Ativo", "Extremamente Ativo"]
    
    @IBOutlet weak var genderPickerView: UIPickerView!
    @IBOutlet weak var activityLevelPickerView: UIPickerView!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var ageStepper: UIStepper!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    var selectedGender = ""
    var selectedAcitivityLevel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderPickerView.delegate = self
        activityLevelPickerView.delegate = self
        genderPickerView.dataSource = self
        activityLevelPickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = 1
        
        if pickerView == genderPickerView {
            countrows = self.genders.count
        }
        else {
            countrows = self.activityLevels.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPickerView {
            selectedGender = genders[row]
            return selectedGender
        } else {
            selectedAcitivityLevel = activityLevels[row]
            return selectedAcitivityLevel
        }
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight) Kg"
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.0f", sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    @IBAction func ageStepperValueChanged(_ sender: UIStepper) {
        let age = String(format: "%.0f", sender.value)
        ageLabel.text = "\(age) anos"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculateTMB()
    }
    
    @IBAction func activityLevelsInfoButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToActivityLevelsInfos", sender: self)
        
    }
    func calculateTMB() {
        let weight = Float(weightSlider.value)
        let height = Float(heightSlider.value)
        let age = Float(ageStepper.value)
        
        tmbManager.calculateTMB(gender: selectedGender, height: height, weight: weight, age: age, activityLevel: selectedAcitivityLevel)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func getActivityLevelIndex(activityLevel: String) -> Int {
        for index in 0...activityLevels.count - 1 {
            if self.activityLevels[index] == activityLevel {
                return index
            }
        }
        return -1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tmbValue = tmbManager.getTMBValue()
            destinationVC.keepWeight = tmbManager.getKeepWeightValue()
            destinationVC.loseWeight = tmbManager.getLoseWeightValue()
            destinationVC.gainWeight = tmbManager.getGainWeightValue()
        }
    }
}



