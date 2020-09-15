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
        
        addSubViews(views: backView,userName)
        backView.addSubview(imageView)
         backView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 10, left: 0, bottom: 60, right: 0))
         imageView.centerInSuperview()
         userName.anchor(top: backView.bottomAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 5, left: 0, bottom: 0, right: 0))
         NSLayoutConstraint.activate([
             backView.centerXAnchor.constraint(equalTo: centerXAnchor),
             userName.centerXAnchor.constraint(equalTo: centerXAnchor)
         ])
   
    }
   
}
