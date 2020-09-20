//
//  DiscussionViewController.swift
//  Discussion App Design
//
//  Created by Hossam on 9/19/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

struct ChatData {
    let userImage:String!
    let userName:String!
    let isVerified:Bool!
    let time:String!
    let message:String!
    let isIncoming:Bool!
}

class DiscussionViewController: UIViewController {

    let chData:[ChatData] = [
        ChatData(userImage: "prof-img1", userName: "dheeraj_ks", isVerified: true, time: "12 min ago", message: "Lorem Ipsum is simply dummy text.", isIncoming: true),
        ChatData(userImage: "prof-img3", userName: "Richard", isVerified: true, time: "10 min ago", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isIncoming: false),
        ChatData(userImage: "prof-img2", userName: "Sammy", isVerified: false, time: "7 min ago", message: "Lorem Ipsum is simply dummy text ", isIncoming: false),
        ChatData(userImage: "prof-img1", userName: "dheeraj_ks", isVerified: true, time: "3 min ago", message: "Lorem Ipsum is simply dummy text of the printing.", isIncoming: true),
    ]
    
    lazy var divider:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0, alpha: 0.1)
        v.constrainHeight(constant: 0.7)
        return v
    }()
    
    lazy var bottomTypeBox:CustomDiscussionBottomBar = {
        let v = CustomDiscussionBottomBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.dynamicColor(.appBackground1)
        return v
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(OutgoingMessageCollectionViewCell.self, forCellWithReuseIdentifier: "OutgoingMessageCollectionViewCell")
        cv.register(IncomingMessageCollectionViewCell.self, forCellWithReuseIdentifier: "IncomingMessageCollectionViewCell")
        cv.backgroundColor = UIColor.dynamicColor(.appBackground1)
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setUpCustomNavBar()
    }
    
    func setupViews()  {
        view.backgroundColor = UIColor.dynamicColor(.appBackground1)

        view.stack(divider,collectionView,bottomTypeBox,spacing:16)
    }

    func setUpCustomNavBar(){
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor  = UIColor.dynamicColor(.appBackground1)
        navigationController?.navigationBar.isTranslucent = false
        
        //MARK:- back Button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        let leftBarButtonItem1 = UIBarButtonItem()
        leftBarButtonItem1.customView = backButton
        
        //MARK:- Title
        let title = UILabel()
        title.text = " Discussing"
        title.textColor = UIColor.dynamicColor(.textColor)
        title.font = UIFont(name: "Avenir-Heavy", size: 20)

        let leftBarButtonItem2 = UIBarButtonItem()
        leftBarButtonItem2.customView = title
        
        navigationItem.setLeftBarButtonItems([leftBarButtonItem1, leftBarButtonItem2], animated: true)
    }
    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }
}

extension DiscussionViewController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if chData[indexPath.row].isIncoming {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OutgoingMessageCollectionViewCell", for: indexPath) as! OutgoingMessageCollectionViewCell
            cell.data = chData[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IncomingMessageCollectionViewCell", for: indexPath) as! IncomingMessageCollectionViewCell
            cell.data = chData[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "Avenir-Medium", size: 16)!
        let desc = chData[indexPath.row].message
        let estimatedH = desc?.heightWithConstrainedWidth(width: (collectionView.frame.width - 140) , font: font)
        return CGSize(width: collectionView.frame.width, height: 130 + estimatedH!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
