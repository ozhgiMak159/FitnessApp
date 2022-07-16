//
//  MainViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let imagePerson: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        image.layer.borderWidth = 5
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    private let calendarView = CalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstrains()
    }
    
}


extension MainViewController {
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(calendarView)
    }
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 80)
        
        ])
    }
}
