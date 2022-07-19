//
//  WeatherView.swift
//  FitnessApp
//
//  Created by Maksim  on 18.07.2022.
//

import UIKit

class WeatherView: UIView {
    
    let weatherImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let weatherStatusLabel = UILabel(
        text: "Солнечно",
        font: .robotoBold24()
    )
    
    private let weatherDescriptionLabel = UILabel(
        text: "Хорошая погода, чтобы позаниматься на улице",
        font: .robotoMedium16()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(weatherImageView, weatherStatusLabel, weatherDescriptionLabel)
        setElementLabel()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementLabel() {
        weatherStatusLabel.adjustsFontSizeToFitWidth = true
        
        weatherDescriptionLabel.adjustsFontSizeToFitWidth = true
        weatherDescriptionLabel.numberOfLines = 2
    }
    
    
    private func setupView(_ subviews: UIView...) {
        backgroundColor = .white
        layer.cornerRadius = 10
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherImageView.heightAnchor.constraint(equalToConstant: 60),
            weatherImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: 10),
            weatherStatusLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            weatherDescriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 0),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherDescriptionLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: -10),
            weatherDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
    }
}
