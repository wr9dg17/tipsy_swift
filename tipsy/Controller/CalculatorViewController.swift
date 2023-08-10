//
//  ViewController.swift
//  tipsy
//
//  Created by Farid Hamzayev on 08.08.23.
//

import UIKit

class CalculatorViewController: UIViewController {
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPercentBtn: UIButton!
  @IBOutlet weak var tenPercentBtn: UIButton!
  @IBOutlet weak var twentyPercentBtn: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  
  var billTotal = 0.0
  var tip = 0.0
  var numberOfPeople = 2
  var finalResult = "0.0"
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult" {
      let destinationVC = segue.destination as! ResultsViewController
      destinationVC.result = finalResult
      destinationVC.tip = Int(tip * 100)
      destinationVC.split = numberOfPeople
    }
  }
  
  @IBAction func tipChanged(_ sender: UIButton) {
    // deselect all tip buttons via IBOutlets
    zeroPercentBtn.isSelected = false
    tenPercentBtn.isSelected = false
    twentyPercentBtn.isSelected = false
    
    // make the button that triggered the IBAction selected.
    sender.isSelected = true
    
    let buttonTitle = sender.currentTitle!
    let buttonTitlewithoutPercent = String(buttonTitle.dropLast())
    let buttonTitleAsNumber = Double(buttonTitlewithoutPercent)!
    tip = buttonTitleAsNumber / 100
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    splitNumberLabel.text = String(format: "%.0f", sender.value)
    numberOfPeople = Int(sender.value)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    let billValue = billTextField.text!
    
    if billValue != "" {
      billTotal = Double(billValue)!
      let result = billTotal * (1 + tip) / Double(numberOfPeople)
      finalResult = String(format: "%.2f", result)
      
      self.performSegue(withIdentifier: "goToResult", sender: self)
    }
  }
  
}

