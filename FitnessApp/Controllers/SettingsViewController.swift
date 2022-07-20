//
//  SettingsViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 19.07.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.delaysContentTouches = false
        scrollView.showsVerticalScrollIndicator = false
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var firstNameStackView = UIStackView()
    private var secondNameStackView = UIStackView()
    private var heightStackView = UIStackView()
    private var weightStackView = UIStackView()
    private var targetStackView = UIStackView()
    private var generalStackView = UIStackView()
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addPhotoImageView.layer.cornerRadius = addPhotoImageView.frame.height / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews(editingProfileLabel, closeButton, addPhotoView, addPhotoImageView, saveButton )
        setConstraints()
        addTaps()
      //  add()
      //  setDelegate()
    }
    
    
    private func setupViews(_ subviews: UIView...) {
        
        view.backgroundColor = .specialBackground
        view.addSubview(scrollView)
        
        subviews.forEach { subview in
            scrollView.addSubview(subview)
        }
        
        firstNameStackView = UIStackView(
            arrangedSubviews: [firstNameLabel, firstNameTextField],
            axis: .vertical,
            spacing: 3
        )
        
        secondNameStackView = UIStackView(
            arrangedSubviews: [secondNameLabel, secondNameTextField],
            axis: .vertical,
            spacing: 3
        )
        
        heightStackView = UIStackView(
            arrangedSubviews: [heightLabel, heightTextField],
            axis: .vertical,
            spacing: 3
        )
        
        weightStackView = UIStackView(
            arrangedSubviews: [weightLabel, weightTextField],
            axis: .vertical,
            spacing: 3
        )
        
        targetStackView = UIStackView(
            arrangedSubviews: [targetLabel, targetTextField],
            axis: .vertical,
            spacing: 3
        )
        
        generalStackView = UIStackView(
            arrangedSubviews: [
                firstNameStackView,
                secondNameStackView,
                heightStackView,
                weightStackView,
                targetStackView
            ],
            axis: .vertical,
            spacing: 20
        )
        
        scrollView.addSubview(generalStackView)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveButtonTapped() {
        
    }
    
    
//    private func setDelegate() {
//        firstNameTextField.delegate = self
//    }
        
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboeard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc private func hideKeyboeard() {
        view.endEditing(true)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        firstNameTextField.isSecureTextEntry = false
//
//        return true
//
//    }

}

extension SettingsViewController {
    
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
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40),
            heightTextField.heightAnchor.constraint(equalToConstant: 40),
            weightTextField.heightAnchor.constraint(equalToConstant: 40),
            targetTextField.heightAnchor.constraint(equalToConstant: 40),
            
            generalStackView.topAnchor.constraint(equalTo: addPhotoView.bottomAnchor, constant: 20),
            generalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: generalStackView.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}


