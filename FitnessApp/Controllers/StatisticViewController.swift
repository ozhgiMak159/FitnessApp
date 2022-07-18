//
//  StatisticViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private let statisticLabel: UILabel = {
       let label = UILabel()
        label.text = "STATISTIC"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Неделя", "Месяц"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialGreen
        segmentedControl.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.font: font as Any,
             NSAttributedString.Key.foregroundColor: UIColor.white],
             for: .normal
        )
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.font: font as Any,
             NSAttributedString.Key.foregroundColor: UIColor.specialGray],
             for: .selected
        )
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let exercisesLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercises"
        label.font = .robotoMedium16()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let identifierCell = "identifierCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(
            statisticLabel, segmentedControl,
            nameTextField, exercisesLabel,
            tableView
        )
        
        setConstraints()
        setDelegate()
    }
    
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
    }
    
    @objc private func segmentChanged() {
        
    }
}

extension StatisticViewController: UITableViewDelegate {
    
}

extension StatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        
        return cell
    }
    
}

extension StatisticViewController {
    
    private func setupView(_ subviews: UIView...) {
        view.backgroundColor = .specialBackground
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            statisticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statisticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        NSLayoutConstraint.activate([
            exercisesLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}
