//
//  UserStoryHeaderCollectionReusableView.swift
//  Discussion App Design
//
//  Created by Hossam on 9/14/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class UserStoryHeaderCollectionReusableView: UICollectionReusableView {
    
    lazy var imageView:UIImageView = {
        let img = UIImageView(image: UIImage(named:"img1"))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 34
        img.constrainWidth(constant: 68)
               img.constrainHeight(constant: 68)
        return img
    }()
    
    lazy var backView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 34
        v.backgroundColor = .white
        v.constrainWidth(constant: 68)
        v.constrainHeight(constant: 68)
        return v
    }()
    
    lazy var addBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"add"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .white
        btn.constrainWidth(constant: 20)
        btn.constrainHeight(constant: 20)
        return btn
    }()
    
    lazy var dividerView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0, alpha: 0.08)
        v.constrainWidth(constant: 2)
        return v
    }()
    
    lazy var userName = UILabel(text: "Add Story", font: UIFont(name: "Avenir-Heavy", size: 13), textColor: UIColor.dynamicColor(.secondaryTextColor), textAlignment: .center)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews(views: backView,userName,dividerView)
        backView.addSubview(imageView)
        dividerView.addSubview(addBtn)
       
        backView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 28, left: 0, bottom: 0, right: 0))
        imageView.centerInSuperview()
        userName.anchor(top: backView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 7, left: 0, bottom: 0, right: 0))
        dividerView.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 40, left: 0, bottom: 60, right: 0))
        addBtn.anchor(top: nil, leading: nil, bottom: backView.bottomAnchor, trailing: backView.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0))

        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
//            imageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
//            imageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            
            userName.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
