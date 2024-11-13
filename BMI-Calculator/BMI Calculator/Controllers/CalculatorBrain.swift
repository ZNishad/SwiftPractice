//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nishad Zulfuqarli on 09.11.24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmiValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight / pow(height, 2)
        
        if bmi < 18.5 {
            bmiValue = BMI(value: bmi, advice: "Eat more pies", color: UIColor.blue)
        } else if bmi < 24.9 {
            bmiValue = BMI(value: bmi, advice: "All right", color: UIColor.green)
        } else {
            bmiValue = BMI(value: bmi, advice: "Stop eating", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmiValue?.value ?? "0.0")
            return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? "Something wrong"
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? UIColor.green
    }
}
