//
//  UILabel + Extensions .swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialLightBrown
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


/*
 private let workoutTodayLabel: UILabel = {
    let label = UILabel()
     label.text = "Workout today"
     label.textColor = .specialLightBrown
     label.font = .robotoMedium14()
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
 */
