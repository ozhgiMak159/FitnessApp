//
//  UITextField + Extensions.swift
//  FitnessApp
//
//  Created by Maksim  on 20.07.2022.
//

import UIKit

extension UITextField {
    
    convenience init(backgroundColor: UIColor) {
        self.init()
        
        self.backgroundColor = backgroundColor
        self.borderStyle = .none
        self.layer.cornerRadius = 10
        self.textColor = .specialGray
        self.font = .robotoBold20()
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftViewMode = .always
        self.clearButtonMode = .always
        self.returnKeyType = .done
        self.keyboardType = .numberPad
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
