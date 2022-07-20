//
//  RepsOrTimers.swift
//  FitnessApp
//
//  Created by Maksim  on 18.07.2022.
//

import UIKit

class RepsOrTimers: UIView {
    
    private let setsLabel = UILabel(text: "Sets", font: .robotoMedium18())
    private let numberOfSetLabel = UILabel(text: "1", font: .robotoMedium24())
    private let repsLabel = UILabel(text: "Reps", font: .robotoMedium18())
    private let numberOfRepsLabel = UILabel(text: "1", font: .robotoMedium24())
    private let timerLabel = UILabel(text: "Timer", font: .robotoMedium18())
    private let numberOfTimerLabel = UILabel(text: "0 min", font: .robotoMedium24())
    private let repeatOrTimerLabel = UILabel(text: "Choose repeat or timer", textColor: .specialLightBrown)
    
    private let setsSlider = UISlider(minimumValue: 1, maximumValue: 50)
    private let repsSlider = UISlider(minimumValue: 1, maximumValue: 50)
    private let timerSlider = UISlider(minimumValue: 1, maximumValue: 600)
    
    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    private var timerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews(setsSlider, repeatOrTimerLabel, repsSlider, timerSlider )
        addTargetSliders()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTargetSliders() {
        setsSlider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        repsSlider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        timerSlider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
    }
    
    @objc private func setsSliderChanged() {
        
    }
    
    @objc private func timerSliderChanged() {
        
    }
    
    @objc private func repsSliderChanged() {
        
    }

    private func setViews(_ subviews: UIView...) {
        backgroundColor = .specialBrown
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
        
        setsStackView = UIStackView(
            arrangedSubviews: [setsLabel, numberOfSetLabel],
            axis: .horizontal,
            spacing: 10
        )
        
        repsStackView = UIStackView(
            arrangedSubviews: [repsLabel, numberOfRepsLabel],
            axis: .horizontal,
            spacing: 10
        )
        
        timerStackView = UIStackView(
            arrangedSubviews: [timerLabel, numberOfTimerLabel],
            axis: .horizontal,
            spacing: 10
        )
        
        subviews.forEach { subview in
            addSubview(subview)
        }
        
        addSubview(setsStackView)
        addSubview(repsStackView)
        addSubview(timerStackView)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 10),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repeatOrTimerLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 15),
            repeatOrTimerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: repeatOrTimerLabel.bottomAnchor, constant: 20),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 10),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
}
