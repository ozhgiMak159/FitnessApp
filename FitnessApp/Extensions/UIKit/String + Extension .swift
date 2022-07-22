//
//  String + Extension .swift
//  FitnessApp
//
//  Created by Maksim  on 22.07.2022.
//

import UIKit

extension String {
    
    enum ValidTypes {
        case text
        case numberPad
    }
    
    enum Regex: String {
        case textReg = "[a-zA-Zа-яА-я]{2,10}"
        case numberPadReg = "[0-9]{2,3}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .text:
            regex = Regex.textReg.rawValue
        case .numberPad:
            regex = Regex.numberPadReg.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
