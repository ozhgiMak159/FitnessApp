//
//  ImageTypeGymCollectionViewCell.swift
//  FitnessApp
//
//  Created by Maksim  on 19.07.2022.
//

import UIKit

class ImageTypeGymCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialBlack
            } else {
                backgroundColor = .specialGray.withAlphaComponent(0.6)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cellConfigure(numberImage: String) {
        imageView.image = UIImage(named: numberImage)
    }
    
    private func setupView() {
        backgroundColor = .specialGray.withAlphaComponent(0.6)
        layer.cornerRadius = 20
        addSubview(imageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
}
