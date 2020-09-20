//
//  IncomingMessageCollectionViewCell.swift
//  Discussion App Design
//
//  Created by Hossam on 9/19/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class IncomingMessageCollectionViewCell: BaseCollectionCell {
    
    
 var data:ChatData?{
        didSet{
            manageData()
        }
    }
    
    lazy var bubbleView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.dynamicColor(.appBackground2)
        v.layer.borderWidth = 1
        v.layer.cornerRadius = 25
        return v
    }()
    
    lazy var userImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 22.5
        img.contentMode = .scaleAspectFill
        img.constrainWidth(constant: 45)
        img.constrainHeight(constant: 45)
        return img
    }()
    
    lazy var userDetail:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    lazy var message:UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "Avenir-Medium", size: 16)
        l.textColor = UIColor.dynamicColor(.secondaryTextColor)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    override func setupViews() {
        
        let ff = hstack(userImage,userDetail,spacing:8)
        
        stack(bubbleView).withMargins(.init(top: 15, left: 70, bottom: 15, right: 30))
        
        bubbleView.stack(ff,message).withMargins(.init(top: 16, left: 20, bottom: 0, right: 20))
        
     
    }
    
    func setUpAttributeText(isVerified:Bool, userName:String, time:String){
        let attributedText = NSMutableAttributedString(string:"@\(userName)  " , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 16)!, NSAttributedString.Key.foregroundColor: UIColor.dynamicColor(.textColor)])
        
        if isVerified {
            let font = UIFont.systemFont(ofSize: 16)
            let verifiyImg = UIImage(named:"verify")
            let verifiedImage = NSTextAttachment()
            verifiedImage.image = verifiyImg
            verifiedImage.bounds = CGRect(x: 0, y: (font.capHeight - 16).rounded() / 2, width: 16, height: 16)
            verifiedImage.setImageHeight(height: 16)
            let imgString = NSAttributedString(attachment: verifiedImage)
            attributedText.append(imgString)
        }
        
        attributedText.append(NSAttributedString(string: "  \(time)" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 14)! ,NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
        userDetail.attributedText = attributedText
    }
    
    func manageData(){
        guard let data = data else {return}
        setUpAttributeText(isVerified: data.isVerified, userName: data.userName, time: data.time)
        userImage.image = UIImage(named: data.userImage)
        message.text = data.message
    }
    
   
}


