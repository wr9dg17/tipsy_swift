//
//  ResultsViewController.swift
//  tipsy
//
//  Created by Farid Hamzayev on 08.08.23.
//

import UIKit

class ResultsViewController: UIViewController {
  var result = "0.0"
  var split = 2
  var tip = 10
  
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var settingsLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    totalLabel.text = result
    settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
  }
  
  @IBAction func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
}
