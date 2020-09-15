//
//  CategoryCollectionViewCell.swift
//  Discussion App Design
//
//  Created by Hossam on 9/14/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: BaseCollectionCell {
    
    
    
    
    override var isSelected: Bool {
        didSet {
            indicatorView.isHidden = isSelected ? false : true
            categoryLabel.textColor = isSelected ? UIColor.dynamicColor(.textColor) : .lightGray
        }
    }
    
    lazy var categoryLabel = UILabel(text: "", font: UIFont.systemFont(ofSize: 14), textColor: .lightGray, textAlignment: .center)
    lazy var indicatorView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 3
        v.backgroundColor = UIColor.dynamicColor(.textColor)
        v.constrainWidth(constant: 6)
        v.constrainHeight(constant: 6)
        return v
    }()
    
    override func setupViews() {
        
        
        addSubViews(views: categoryLabel,indicatorView)

        categoryLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 5, left: 5, bottom: 0, right: 5))
        indicatorView.anchor(top: categoryLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 3, left: 0, bottom: 0, right: 0))
        
        
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        indicatorView.isHidden = true
    }
    
}
