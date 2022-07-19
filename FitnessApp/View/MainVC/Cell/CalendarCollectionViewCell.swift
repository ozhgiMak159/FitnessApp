//
//  CalendarCollectionViewCell.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
        
    private let dayOfWeekLabel = UILabel(
        text: "WE",
        font: .robotoBold16(),
        textColor: .white,
        textAlignment: .center
    )
        
    private let numberOfDayLabel = UILabel(
        text: "16",
        font: .robotoBold20(),
        textColor: .white
    )
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                layer.cornerRadius = 10
                dayOfWeekLabel.textColor = .specialBlack
                numberOfDayLabel.textColor = .specialDarkGreen
            } else {
                backgroundColor = .specialGreen
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup view and set constraints
extension CalendarCollectionViewCell {
    private func setupViews() {
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
