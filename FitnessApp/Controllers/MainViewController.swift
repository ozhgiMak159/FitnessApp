//
//  MainViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let calendarView = CalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
    }
    
}


extension MainViewController {
    
    private func setupView() {
        view.backgroundColor = .specialBackground
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
