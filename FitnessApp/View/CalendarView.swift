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
    
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Maksim Ozhgibecov"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    private let identifierCollectionCell = "identifierCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        setDelegate()
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: identifierCollectionCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        
        addSubview(imagePerson)
        addSubview(userNameLabel)
        addSubview(collectionView)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imagePerson.layer.cornerRadius = imagePerson.frame.height / 2
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imagePerson.topAnchor.constraint(equalTo: topAnchor, constant: -40),
            imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            imagePerson.heightAnchor.constraint(equalToConstant: 100),
            imagePerson.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: imagePerson.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: imagePerson.trailingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

extension CalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath)")
    }

}

extension CalendarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCollectionCell, for: indexPath) as! CalendarCollectionViewCell
        
        return cell
    }
    
    
}

extension CalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: 34,
            height: collectionView.frame.height
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}
