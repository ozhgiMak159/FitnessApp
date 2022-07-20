//
//  UISlider + Extensions.swift
//  FitnessApp
//
//  Created by Maksim  on 20.07.2022.
//

import UIKit

extension UISlider {
    /*
     private let setsSlider: UISlider = {
         let slider = UISlider()
         slider.minimumValue = 1
         slider.maximumValue = 50
         slider.maximumTrackTintColor = .specialLightBrown
         slider.minimumTrackTintColor = .specialGreen
         slider.translatesAutoresizingMaskIntoConstraints = false
         slider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
         return slider
     }()
     
     private let repsSlider: UISlider = {
         let slider = UISlider()
         slider.minimumValue = 1
         slider.maximumValue = 50
         slider.maximumTrackTintColor = .specialLightBrown
         slider.minimumTrackTintColor = .specialGreen
         slider.translatesAutoresizingMaskIntoConstraints = false
         slider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
         return slider
     }()
     
     private let timerSlider: UISlider = {
         let slider = UISlider()
         slider.minimumValue = 1
         slider.maximumValue = 600
         slider.maximumTrackTintColor = .specialLightBrown
         slider.minimumTrackTintColor = .specialGreen
         slider.translatesAutoresizingMaskIntoConstraints = false
         slider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
         return slider
     }()
     
     */
    
    
//    convenience init(text: String, font: UIFont? = .robotoMedium14(), textColor: UIColor? = .specialGray, textAlignment: NSTextAlignment = .left) {
//        self.init()
//
//        self.text = text
//        self.font = font
//        self.textColor = textColor
//        self.textAlignment = textAlignment
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
    
    
    convenience init(minimumValue: Float, maximumValue: Float,
                     maximumTrackTintColor: UIColor = .specialLightBrown,
                     minimumTrackTintColor: UIColor = .specialGreen) {
        self.init()
        
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.maximumTrackTintColor = maximumTrackTintColor
        self.minimumTrackTintColor = minimumTrackTintColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}

