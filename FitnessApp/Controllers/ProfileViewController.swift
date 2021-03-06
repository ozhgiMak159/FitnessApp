//
//  ProfileViewController.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
        
    private let profileLabel = UILabel(text: "PROFILE", font: .robotoMedium24(), textAlignment: .center)
    private let userNameLabel = UILabel(text: "YOUR NAME", font: .robotoBold24(), textColor: .white)
    private let userHeightLabel = UILabel(text: "Height: _", font: .robotoBold16())
    private let userWeightLabel = UILabel(text: "Weight: _", font: .robotoBold16())
    private let targetLabel = UILabel(text: "TARGET: 0 workouts", font: .robotoBold16())
    private let workoutsNowLabel = UILabel(text: "0", font: .robotoBold24())
    private let workoutsTargetLabel = UILabel(text: "0", font: .robotoBold24())
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userPhotoView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let targetView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .specialBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing ", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .specialGreen
        button.semanticContentAttribute = .forceRightToLeft
        button.setImage(UIImage(named: "profileEditing"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editingButtonTap), for: .touchUpInside)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        collectionVIew.bounces = false
        collectionVIew.showsHorizontalScrollIndicator = false
        collectionVIew.backgroundColor = .none
        return collectionVIew
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .specialBrown
        progressView.progressTintColor = .specialGreen
        progressView.layer.cornerRadius = 14
        progressView.clipsToBounds = true
        progressView.setProgress(0, animated: false)
        progressView.layer.sublayers?[1].cornerRadius = 14
        progressView.subviews[1].clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private var targetStackView = UIStackView()
    private var userParamStackView = UIStackView()
    
    private let idProfileCollectionViewCell = "idProfileCollectionViewCell"
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialBackground
        setView(
            profileLabel, userPhotoView,
            userPhotoImageView, userNameLabel,
            editingButton,
            collectionView, targetLabel,
            targetView,
            progressView
        )

        setConstraints()
        setDelegates()
    }
    
    @objc private func editingButtonTap() {
        let settingViewController = SettingsViewController()
        settingViewController.modalPresentationStyle = .fullScreen
        present(settingViewController, animated: true)
    }
}

extension ProfileViewController {
    private func setView(_ subviews: UIView...) {
        view.backgroundColor = .specialBackground
        
        userParamStackView = UIStackView(
            arrangedSubviews: [userHeightLabel, userWeightLabel],
            axis: .horizontal,
            spacing: 10
        )
        view.addSubview(userParamStackView)
        
        targetStackView = UIStackView(
            arrangedSubviews: [workoutsNowLabel, workoutsTargetLabel],
            axis: .horizontal,
            spacing: 10
        )
        view.addSubview(targetStackView)
        
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setDelegates() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 90),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            userPhotoView.topAnchor.constraint(equalTo: userPhotoImageView.topAnchor, constant: 45),
            userPhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userPhotoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userPhotoView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.bottomAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: -20),
            userNameLabel.centerXAnchor.constraint(equalTo: userPhotoView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userParamStackView.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 5),
            userParamStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            editingButton.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editingButton.heightAnchor.constraint(equalToConstant: 25),
            editingButton.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: userParamStackView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            targetLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            targetStackView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 10),
            targetStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            targetStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            targetView.topAnchor.constraint(equalTo: targetStackView.bottomAnchor, constant: 3),
            targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            targetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            targetView.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
}
