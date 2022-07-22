//
//  String + Extension .swift
//  FitnessApp
//
//  Created by Maksim  on 22.07.2022.
//

import UIKit

extension String {
    
    enum ValidTypes {
        case firstName
    }
    
    enum Regex: String {
        case firstName = "[a-zA-Zа-яА-я]{2,10}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .firstName:
            regex = Regex.firstName.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
    
    
    
}
