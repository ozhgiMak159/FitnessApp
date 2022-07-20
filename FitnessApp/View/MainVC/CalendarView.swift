//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Maksim  on 16.07.2022.
//

import UIKit

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
        
    private let userNameLabel = UILabel(text: "Maksim Ozhgibecov", font: .robotoMedium24())
    
    private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    private let identifierCollectionCell = "identifierCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(imagePerson, userNameLabel, collectionView)
        setElement()
        setConstraints()
        setDelegate()
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: identifierCollectionCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElement() {
        userNameLabel.adjustsFontSizeToFitWidth = true
        userNameLabel.minimumScaleFactor = 0.5
    }
    
    private func setupView(_ subviews: UIView...) {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imagePerson.layer.cornerRadius = imagePerson.frame.height / 2
    }
    
    //?
    private func weekArray() -> [[String]] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEEEE"
        
        var weekArray: [[String]] = [[],[]]
        let calendar = Calendar.current
        let today = Date()
        
        for i in 0...7 {
            let date = calendar.date(byAdding: .weekday, value: i, to: today)
            guard let date = date else { return weekArray }
            
            let components = calendar.dateComponents([.day], from: date)
            weekArray[1].append(String(components.day ?? 0))
            
            let weekDay = dateFormatter.string(from: date)
            weekArray[0].append(String(weekDay))
        }
        
        return weekArray
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
        cell.cellConfigure(weekArray: weekArray(), indexPath: indexPath)
        
        if indexPath.item == 0 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        }
        
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
