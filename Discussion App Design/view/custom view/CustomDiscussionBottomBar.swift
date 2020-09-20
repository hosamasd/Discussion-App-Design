//
//  CustomDiscussionBottomBar.swift
//  Discussion App Design
//
//  Created by Hossam on 9/19/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomDiscussionBottomBar: CustomBaseView {

    lazy var dividerView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0, alpha: 0.1)
        v.constrainHeight(constant: 1)
        return v
    }()
    
    lazy var attachmentBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 100/255, green: 162/255, blue: 53/255, alpha: 1)
        btn.setImage(UIImage(named: "attachment"), for: .normal)
        btn.layer.cornerRadius = 30
        btn.constrainWidth(constant: 60)
        btn.constrainHeight(constant: 60)
        return btn
    }()
    
    lazy var typeLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Type.."
        l.font = UIFont(name: "Avenir-Medium", size: 18)
        l.textColor = .lightGray
        
        return l
    }()
    
    override func setupViews() {
        backgroundColor = .red
        addSubview(dividerView)
        
        dividerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        hstack(typeLabel,attachmentBtn).withMargins(.init(top: 10, left: 32, bottom: 10, right: 32))
        
//        addSubview(dividerView)
//        addSubview(typeLabel)
//        addSubview(attachmentBtn)
//        
//        
//        
//        
//        NSLayoutConstraint.activate([
//            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            dividerView.topAnchor.constraint(equalTo: topAnchor),
//            dividerView.heightAnchor.constraint(equalToConstant: 1),
//            
//            attachmentBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            attachmentBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
//            attachmentBtn.widthAnchor.constraint(equalToConstant: 60),
//            attachmentBtn.heightAnchor.constraint(equalToConstant: 60),
//            
//            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            typeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
    }
    
   
}
