//
//  UILabel + Extensions .swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? = .robotoMedium14(), textColor: UIColor? = .specialGray, textAlignment: NSTextAlignment = .left) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


/*
 let weatherStatusLabel: UILabel = {
    let label = UILabel()
     label.text = "Солнечно"
     label.font = .robotoBold24()
     label.textColor = .specialGray
     label.adjustsFontSizeToFitWidth = true
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
 */
