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
    
    var bmiValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.1fkg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bmiValue = weightSlider.value / pow(heightSlider.value, 2)
        print(bmiValue)
        self.bmiValue = String(format: "%.1f", bmiValue)
    
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", bmiValue)
//        self.present(secondVC, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = self.bmiValue
        }
        
    }
}

