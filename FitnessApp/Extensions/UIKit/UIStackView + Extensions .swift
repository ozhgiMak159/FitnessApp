//
//  UIStackView + Extensions .swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fill, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
