//
//  DateAndReapeatView.swift
//  FitnessApp
//
//  Created by Maksim  on 18.07.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dateLabel = UILabel(
        text: "Date",
        font: .robotoMedium22()
    )
    
    private let dataPicker: UIDatePicker = {
       let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.tintColor = .specialGreen
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
        
    private let repeatLabel = UILabel(
        text: "Repeat every 7 days",
        font: .robotoMedium22()
    )
    
    
    private let repeatSwitch: UISwitch = {
       let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    private var dateStackView = UIStackView()
    private var repeatStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
        
        dateStackView = UIStackView(
            arrangedSubviews: [dateLabel, dataPicker],
            axis: .horizontal,
            spacing: 10
        )
        
        repeatStackView = UIStackView(
            arrangedSubviews: [repeatLabel, repeatSwitch],
            axis: .horizontal,
            spacing: 10
        )
        
        addSubview(dateStackView)
        addSubview(repeatStackView)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
    }
}
