//
//  TypeGymView.swift
//  FitnessApp
//
//  Created by Maksim  on 19.07.2022.
//

import UIKit

class TypeGymView: UIView {

   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupView() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        
    }
    
    
    

}
