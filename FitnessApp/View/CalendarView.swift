//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

// Класс это сама фигура 

class CalendarView: UIView {
    
    private let imagePerson: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        image.layer.borderWidth = 5
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        
        addSubview(imagePerson)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imagePerson.layer.cornerRadius = imagePerson.frame.height / 2
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imagePerson.topAnchor.constraint(equalTo: topAnchor, constant: -50),
            imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            imagePerson.heightAnchor.constraint(equalToConstant: 100),
            imagePerson.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
}
