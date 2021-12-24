//
//  ViewController.swift
//  BMICalc
//
//  Created by Kostadin Samardzhiev on 23.12.21.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorBrain.height = heightSlider.value
        calculatorBrain.weight = weightSlider.value
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        calculatorBrain.height = sender.value
        heightLabel.text = calculatorBrain.getHeight()
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        calculatorBrain.weight = sender.value
        weightLabel.text = calculatorBrain.getWeight()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBmi()
    
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", bmiValue)
//        self.present(secondVC, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = calculatorBrain.getBmiValue()
            resultVC.adviceValue = calculatorBrain.getAdvice()
        }
        
    }
}

