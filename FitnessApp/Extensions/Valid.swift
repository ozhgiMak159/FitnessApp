//
//  Valid.swift
//  FitnessApp
//
//  Created by Maksim  on 22.07.2022.
//

import Foundation

struct ValidNumber {
    let numbers = "1234567890"
    
    func hasNumbers(text: String) -> Bool {
        for number in numbers {
            if text.contains(number) { return true }
        }
        return false
    }
    
}
