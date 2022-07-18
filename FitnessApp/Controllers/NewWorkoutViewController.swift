//
//  NewWorkoutViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 18.07.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel: UILabel = {
       let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .robotoMedium16()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let nameRepeatAndDate: UILabel = {
       let label = UILabel()
        label.text = "Date and repeat"
        label.font = .robotoMedium16()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateAndRepeat = DateAndRepeatView()
    
    private let repsAndTimersLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps or timer"
        label.font = .robotoMedium16()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsOrTimerView = RepsOrTimers()
    
    private let gymImage: UILabel = {
       let label = UILabel()
        label.text = "Здесь будет скролл с фотками"
        label.font = .robotoMedium16()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialBackground
        
        setupView()
        setConstraints()
    }
    
    @objc private func closeButtonTapp() {
        print("Tapp")
    }
    
    @objc private func saveButtonTapped() {
        
    }
    
}

extension NewWorkoutViewController {
    private func setupView() {
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        
        view.addSubview(nameRepeatAndDate)
        view.addSubview(dateAndRepeat)
        
        view.addSubview(repsAndTimersLabel)
        view.addSubview(repsOrTimerView)
        
        view.addSubview(gymImage)
        view.addSubview(saveButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            nameRepeatAndDate.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            nameRepeatAndDate.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeat.topAnchor.constraint(equalTo: nameRepeatAndDate.bottomAnchor, constant: 3),
            dateAndRepeat.leadingAnchor.constraint(equalTo: nameRepeatAndDate.leadingAnchor),
            dateAndRepeat.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            dateAndRepeat.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            repsAndTimersLabel.topAnchor.constraint(equalTo: dateAndRepeat.bottomAnchor, constant: 15),
            repsAndTimersLabel.leadingAnchor.constraint(equalTo: dateAndRepeat.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsAndTimersLabel.bottomAnchor, constant: 3),
            repsOrTimerView.leadingAnchor.constraint(equalTo: repsAndTimersLabel.leadingAnchor),
            repsOrTimerView.trailingAnchor.constraint(equalTo: dateAndRepeat.trailingAnchor),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 320)
        ])
        
        NSLayoutConstraint.activate([
            gymImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gymImage.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: gymImage.bottomAnchor, constant: 90),
            saveButton.leadingAnchor.constraint(equalTo: repsOrTimerView.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: repsOrTimerView.trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    
    
}
