//
//  StoryCollectionViewCell.swift
//  Discussion App Design
//
//  Created by Hossam on 9/14/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: BaseCollectionCell {
    
    lazy var imageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        img.clipsToBounds = true
        img.layer.cornerRadius = 34
        img.constrainWidth(constant: 68)
               img.constrainHeight(constant: 68)
        return img
    }()
    
    lazy var backView:UIView = {
        let v = UIView(backgroundColor: UIColor.dynamicColor(.appBackground1))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.borderWidth = 2
        v.layer.cornerRadius = 40
        v.constrainWidth(constant: 80)
        v.constrainHeight(constant: 80)
        return v
    }()
    
    lazy var userName = UILabel(text: "", font: UIFont(name: "Avenir-Heavy", size: 13), textColor: UIColor.dynamicColor(.secondaryTextColor), textAlignment: .center)
    
    override func setupViews() {
        
   
        addSubview(backView)
        backView.addSubview(imageView)
        addSubview(userName)
      
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backView.widthAnchor.constraint(equalToConstant: 80),
            backView.heightAnchor.constraint(equalToConstant: 80),
            
            imageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 68),
            imageView.heightAnchor.constraint(equalToConstant: 68),
            userName.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 5),
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),
            userName.leadingAnchor.constraint(equalTo: leadingAnchor),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
   
}
