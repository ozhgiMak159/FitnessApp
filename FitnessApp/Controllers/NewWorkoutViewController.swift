//
//  NewWorkoutViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 18.07.2022.
//

import UIKit
import IQKeyboardManagerSwift

class NewWorkoutViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.delaysContentTouches = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private let newWorkoutLabel = UILabel(
        text: "NEW WORKOUT",
        font: .robotoMedium24(),
        textAlignment: .center
    )
    
    private let closeButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    private let nameLabel = UILabel(
        text: "Name",
        font: .robotoMedium16(),
        textColor: .specialLightBrown
    )
    
    //???
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
        
    private let nameRepeatAndDate = UILabel(
        text: "Date and repeat",
        font: .robotoMedium16(),
        textColor: .specialLightBrown
    )
    
    private let repsOrTimerView = RepsOrTimers()
    private let dateAndRepeat = DateAndRepeatView()
    private let typeGymView = TypeGymView()
        
    private let repsAndTimersLabel = UILabel(
        text: "Reps or timer",
        font: .robotoMedium16(),
        textColor: .specialLightBrown
    )
        
    private let typeTraining = UILabel(
        text: "Type of training",
        font: .robotoMedium16(),
        textColor: .specialLightBrown
    )
    
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardManagerVisible(false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardManagerVisible(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(
            newWorkoutLabel, closeButton,
            nameLabel, nameTextField,
            nameRepeatAndDate, dateAndRepeat,
            repsAndTimersLabel, repsOrTimerView,
            typeTraining, typeGymView, saveButton
        )

        setConstraints()
        addTaps()
        setDelegate()
    }
    
    @objc private func closeButtonTapp() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveButtonTapped() {
        
    }
    
    private func setDelegate() {
        nameTextField.delegate = self
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboeard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc private func hideKeyboeard() {
        view.endEditing(true)
    }
    
}

extension NewWorkoutViewController: UITextFieldDelegate {
        
    // когда заканчиивается редактироавния
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
    }
    
    
}

extension NewWorkoutViewController {
    
    private func keyboardManagerVisible(_ state: Bool) {
        IQKeyboardManager.shared.enableAutoToolbar = state
    }
    
    private func setupView(_ subviews: UIView...) {
        view.backgroundColor = .specialBackground
        view.addSubview(scrollView)
        
        subviews.forEach { subview in
            scrollView.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
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
            nameRepeatAndDate.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            nameRepeatAndDate.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeat.topAnchor.constraint(equalTo: nameRepeatAndDate.bottomAnchor, constant: 3),
            dateAndRepeat.leadingAnchor.constraint(equalTo: nameRepeatAndDate.leadingAnchor),
            dateAndRepeat.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            dateAndRepeat.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            repsAndTimersLabel.topAnchor.constraint(equalTo: dateAndRepeat.bottomAnchor, constant: 10),
            repsAndTimersLabel.leadingAnchor.constraint(equalTo: dateAndRepeat.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsAndTimersLabel.bottomAnchor, constant: 3),
            repsOrTimerView.leadingAnchor.constraint(equalTo: repsAndTimersLabel.leadingAnchor),
            repsOrTimerView.trailingAnchor.constraint(equalTo: dateAndRepeat.trailingAnchor),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 320)
        ])
        
        NSLayoutConstraint.activate([
            typeTraining.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 10),
            typeTraining.leadingAnchor.constraint(equalTo: repsOrTimerView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            typeGymView.topAnchor.constraint(equalTo: typeTraining.bottomAnchor, constant: 3),
            typeGymView.leadingAnchor.constraint(equalTo: repsOrTimerView.leadingAnchor),
            typeGymView.trailingAnchor.constraint(equalTo: repsOrTimerView.trailingAnchor),
            typeGymView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: typeGymView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: typeGymView.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: typeGymView.trailingAnchor),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    
    
}
