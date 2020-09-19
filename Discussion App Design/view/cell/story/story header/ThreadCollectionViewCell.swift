//
//  ThreadCollectionViewCell.swift
//  Discussion App Design
//
//  Created by Hossam on 9/14/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class ThreadCollectionViewCell: BaseCollectionCell {
    
    var data:TweetData?{
        didSet{
            manageData()
        }
    }
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var userImage:UIImageView = {
        let img = UIImageView(image: UIImage(named:"prof-img1"))
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
    
    lazy var descriptionLabel = UILabel(text: "", font: UIFont(name: "Avenir-Medium", size: 16), textColor: UIColor.dynamicColor(.secondaryTextColor),  numberOfLines: 0)
    
    lazy var optionBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "moreBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = UIColor.dynamicColor(.iconColor)
        btn.constrainWidth(constant: 25)
        btn.constrainHeight(constant: 25)
        return btn
    }()
    
    lazy var stackView1:UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //MARK:- Like View
    
    lazy var likeView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var likeImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "heart")?.withRenderingMode(.alwaysTemplate))
        img.constrainWidth(constant: 25)
               img.constrainHeight(constant: 25)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.tintColor = UIColor.dynamicColor(.iconColor)
        return img
    }()
    
    lazy var likeLabel = UILabel(text: "3.4k", font: UIFont(name:"Avenir-Medium", size: 14), textColor:  UIColor.dynamicColor(.iconColor), textAlignment: .center)
    lazy var likeStack = hstack(likeImage,likeLabel,spacing:8)

    //MARK:- Retweet View
    
    lazy var retweetView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var retweetImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "retweet")?.withRenderingMode(.alwaysTemplate))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.tintColor = UIColor.dynamicColor(.iconColor)
        img.constrainWidth(constant: 25)
               img.constrainHeight(constant: 25)
        return img
    }()
    
    lazy var retweetLabel = UILabel(text: "3.4k", font: UIFont(name:"Avenir-Medium", size: 14), textColor: UIColor.dynamicColor(.iconColor), textAlignment: .center)
    lazy var retweetStack = hstack(retweetImage,retweetLabel,spacing:8)
    //MARK:- Message View
    
    lazy var messageView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var messageImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "message")?.withRenderingMode(.alwaysTemplate))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.tintColor = UIColor.dynamicColor(.iconColor)
        img.constrainWidth(constant: 25)
               img.constrainHeight(constant: 25)
        return img
    }()
    
    lazy var messageLabel = UILabel(text: "3.4k", font: UIFont(name:"Avenir-Medium", size: 14), textColor:  UIColor.dynamicColor(.iconColor), textAlignment: .center)
    lazy var messageStack = hstack(messageImage,messageLabel,spacing:8)

    lazy var starImage:UIImageView = {
        let img = UIImageView(image: UIImage(named: "star")?.withRenderingMode(.alwaysTemplate))
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = UIColor.dynamicColor(.iconColor)
        img.contentMode = .scaleAspectFill
        img.constrainWidth(constant: 25)
               img.constrainHeight(constant: 25)
        return img
    }()

    lazy var headerDivide:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0, alpha: 0.08)
        v.constrainHeight(constant: 1)
        return v
    }()
    
    
    override func setupViews() {
        addSubview(headerDivide)
        let d = hstack(userImage,userDetail,stack(optionBtn,UIView()),spacing:8)
        let bottom = hstack(likeStack,retweetStack,messageStack,UIView(),starImage,spacing:16)
        
        stack(d,descriptionLabel,bottom,spacing:16).withMargins(.init(top: 16, left: 16, bottom: 32, right: 16))
        
        headerDivide.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 16, bottom: 16, right: 0))
        
    }
    
    func setUpAttributeText(category:String , isVerified:Bool, userName:String, time:String){
        let attributedText = NSMutableAttributedString(string:"\(category)\n" , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 14)!,NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedText.append(NSAttributedString(string: "@\(userName)  " , attributes:[NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 16)!, NSAttributedString.Key.foregroundColor: UIColor.dynamicColor(.textColor)]))
        
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
        userImage.image = UIImage(named: data.userImage)
        setUpAttributeText(category: data.category, isVerified: data.isVerified, userName: data.userName, time: data.time)
        descriptionLabel.text = data.threadDesc
        likeLabel.text = data.likeCount
        retweetLabel.text = data.retweetCount
        messageLabel.text = data.messageCount
    }
    
   
}

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        
        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}
