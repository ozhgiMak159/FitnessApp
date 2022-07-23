//
//  SettingsViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 19.07.2022.
//

import UIKit
import IQKeyboardManagerSwift

class SettingsViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.delaysContentTouches = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private let editingProfileLabel = UILabel(
        text: "EDITING PROFILE",
        font: .robotoMedium24(),
        textAlignment: .center
    )
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let addPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.image = UIImage(named: "addPhoto")
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addPhotoView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let wrongButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.isHidden = false
        button.addTarget(self, action: #selector(tapAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let wrongButton1: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.isHidden = false
        button.addTarget(self, action: #selector(tapAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heightLabel = UILabel(text: "Height", textColor: .specialLightBrown)
    private let weightLabel = UILabel(text: "Weight", textColor: .specialLightBrown)
    private let targetLabel = UILabel(text: "Target", textColor: .specialLightBrown)
    private let secondNameLabel = UILabel(text: "Second name", textColor: .specialLightBrown)
    private let firstNameLabel = UILabel(text: "First name",textColor: .specialLightBrown)
    
    private let firstNameTextField = UITextField(backgroundColor: .specialBrown, keyboardType: .emailAddress)
    private let secondNameTextField = UITextField(backgroundColor: .specialBrown, keyboardType: .emailAddress)
    private let heightTextField = UITextField(backgroundColor: .specialBrown)
    private let weightTextField = UITextField(backgroundColor: .specialBrown)
    private let targetTextField = UITextField(backgroundColor: .specialBrown)
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var firstNameStackView = UIStackView()
    private var secondNameStackView = UIStackView()
    private var generalStackView = UIStackView()
    
    private let firstNameValidType: String.ValidTypes = .text
    private let numberPad: String.ValidTypes = .numberPad
    private var validator = ValidNumber()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneHeightUnlock()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addPhotoImageView.layer.cornerRadius = addPhotoImageView.frame.height / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews(
            editingProfileLabel, closeButton,
            addPhotoView,addPhotoImageView,
            firstNameLabel, firstNameTextField,wrongButton,
            secondNameLabel, wrongButton1, secondNameTextField,
            heightLabel, heightTextField,
            weightLabel,weightTextField,
            targetLabel, targetTextField,
            saveButton
        )
        
        setDelegate(textFields:
            firstNameTextField,
            secondNameTextField,
            heightTextField,
            weightTextField,
            targetTextField)
    
        addTaps()
        setupKeyboard()
        setConstraints()
    }
        
    private func setupViews(_ subviews: UIView...) {
        
        view.backgroundColor = .specialBackground
        view.addSubview(scrollView)
        
        subviews.forEach { subview in
            scrollView.addSubview(subview)
        }
    }
    
    private func phoneHeightUnlock() {
        if view.frame.height < 570 {
            scrollView.isScrollEnabled = true
            scrollView.showsVerticalScrollIndicator = true
        } else {
            scrollView.isScrollEnabled = false
        }
    }
    
    private func activeSaveButton() {
        if firstNameTextField.text!.count > 1 && secondNameTextField.text!.count > 1 && heightTextField.text!.count > 1 && weightTextField.text!.count > 1 && targetTextField.text!.count > 1 {
            saveButton.isEnabled = true
          //  print("кнопка активна")
        } else {
            saveButton.isEnabled = false
          //  print("кнопка не активна")
        }
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func tapAlert() {
        print("Tapp")
    }
    
    @objc private func saveButtonTapped() {
        
    }
    
    
    private func setDelegate(textFields: UITextField...) {
        textFields.forEach { setDelegateTextF in
            setDelegateTextF.delegate = self
        }
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
        activeSaveButton()
       // print("Do2ne")
    }
    
    private func setTextField(textField: UITextField, label: UILabel, wrongButton: UIButton? = nil, validType: String.ValidTypes, string: String, range: NSRange) {

        let text = (textField.text ?? "") + string
        let result: String

        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        
        textField.text = result

        if result.isValid(validType: validType) {
            label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            wrongButton?.isHidden = true
        } else if textField.text!.isEmpty {
            label.textColor = .specialLightBrown
            wrongButton?.isHidden = true
        } else {
            label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            wrongButton?.isHidden = false
            wrongButton?.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
        /*
         struct ValidNumber {
             let numbers = "1234567890"
             
             func hasNumbers(text: String) -> Bool {
                 for number in numbers {
                     if text.contains(number) { return true }
                 }
                 return false
             }
             
         }
         */

    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstNameTextField || textField == secondNameTextField {
            IQKeyboardManager.shared.toolbarDoneBarButtonItemText = ""
        } else {
            IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
        }
       // activeSaveButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        activeSaveButton()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeSaveButton()
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        switch textField {
        case firstNameTextField:
            firstNameLabel.textColor = .specialLightBrown
            wrongButton.isHidden = true
        case secondNameTextField:
            secondNameLabel.textColor = .specialLightBrown
            wrongButton1.isHidden = true
        case heightTextField:
            heightLabel.textColor = .specialLightBrown
        case weightTextField:
            weightLabel.textColor = .specialLightBrown
        default:
            targetLabel.textColor = .specialLightBrown
        }
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        switch textField {
        case firstNameTextField:
            setTextField(
                textField: firstNameTextField,
                label: firstNameLabel,
                wrongButton: wrongButton,
                validType: firstNameValidType,
                string: string,
                range: range
            )
            
        case secondNameTextField:
            setTextField(
                textField: secondNameTextField,
                label: secondNameLabel,
                wrongButton: wrongButton1,
                validType: firstNameValidType,
                string: string,
                range: range
            )
        case heightTextField:
            setTextField(
                textField: heightTextField,
                label: heightLabel,
                validType: numberPad,
                string: string,
                range: range
            )
        case weightTextField:
            setTextField(
                textField: weightTextField,
                label: weightLabel,
                validType: numberPad,
                string: string,
                range: range
            )
        default:
            setTextField(
                textField: targetTextField,
                label: targetLabel,
                validType: numberPad,
                string: string,
                range: range
            )
        }

        return false
    }
    
}

extension SettingsViewController {
    
    private func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = .specialBlack
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            editingProfileLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            editingProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: editingProfileLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            addPhotoImageView.topAnchor.constraint(equalTo: editingProfileLabel.bottomAnchor, constant: 20),
            addPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            addPhotoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            addPhotoView.topAnchor.constraint(equalTo: addPhotoImageView.topAnchor, constant: 50),
            addPhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addPhotoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addPhotoView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: addPhotoView.bottomAnchor, constant: 20),
            firstNameLabel.leadingAnchor.constraint(equalTo: addPhotoView.leadingAnchor),
            
            wrongButton.centerYAnchor.constraint(equalTo: firstNameLabel.centerYAnchor),
            wrongButton.leadingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor, constant: 5),
            
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 5),
            firstNameTextField.leadingAnchor.constraint(equalTo: addPhotoView.leadingAnchor),
            firstNameTextField.trailingAnchor.constraint(equalTo: addPhotoView.trailingAnchor),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            secondNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10),
            secondNameLabel.leadingAnchor.constraint(equalTo: firstNameTextField.leadingAnchor),
            
            wrongButton1.centerYAnchor.constraint(equalTo: secondNameLabel.centerYAnchor),
            wrongButton1.leadingAnchor.constraint(equalTo: secondNameLabel.trailingAnchor, constant: 5),
            
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 5),
            secondNameTextField.leadingAnchor.constraint(equalTo: firstNameTextField.leadingAnchor),
            secondNameTextField.trailingAnchor.constraint(equalTo: firstNameTextField.trailingAnchor),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            heightLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 10),
            heightLabel.leadingAnchor.constraint(equalTo: secondNameTextField.leadingAnchor),
            
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 5),
            heightTextField.leadingAnchor.constraint(equalTo: secondNameTextField.leadingAnchor),
            heightTextField.trailingAnchor.constraint(equalTo: secondNameTextField.trailingAnchor),
            heightTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 10),
            weightLabel.leadingAnchor.constraint(equalTo: heightTextField.leadingAnchor),
            
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5),
            weightTextField.leadingAnchor.constraint(equalTo: heightTextField.leadingAnchor),
            weightTextField.trailingAnchor.constraint(equalTo: heightTextField.trailingAnchor),
            weightTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            targetLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 10),
            targetLabel.leadingAnchor.constraint(equalTo: weightTextField.leadingAnchor),
            
            targetTextField.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 5),
            targetTextField.leadingAnchor.constraint(equalTo: weightTextField.leadingAnchor),
            targetTextField.trailingAnchor.constraint(equalTo: weightTextField.trailingAnchor),
            targetTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: targetTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}


