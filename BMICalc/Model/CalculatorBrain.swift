//
//  CalculatorBrain.swift
//  BMICalc
//
//  Created by Kostadin Samardzhiev on 24.12.21.
//

import Foundation

struct CalculatorBrain {
    var height: Float?
    var weight: Float?
    var bmiValue: Float?
    
    mutating func calculateBmi() {
        bmiValue = weight! / pow(height!, 2)
    }
    
    func getBmiValue() -> String {
        return String(format: "%.1f", bmiValue!)
    }
    
    func getHeight() -> String {
        return String(format: "%.2fm", height!)
    }
    
    func getWeight() -> String {
        return String(format: "%.1fkg", weight!)
    }
    
    func getAdvice() -> String {
        if bmiValue! < 18.5 {
            return "Eat some snack!"
        } else if bmiValue! < 24.9 {
            return "You are perfect!"
        } else {
            return "Do some excercises!"
        }
    }
}
