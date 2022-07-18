//
//  MainViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    
    private let addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .robotoMedium12()
        button.tintColor = .specialDarkGreen
        button.setImage(UIImage(named: "addWorkout"), for: .normal)
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(calendarView, addWorkoutButton, weatherView)
        setConstrains()
    }
    
}

extension MainViewController {
    
    private func setupView(_ subviews: UIView...) {
        view.backgroundColor = .specialBackground
        
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
    }
}
