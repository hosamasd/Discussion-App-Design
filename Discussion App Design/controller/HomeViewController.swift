//
//  ViewController.swift
//  Discussion App Design
//
//  Created by Hossam on 9/14/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

struct TweetData {
    let userImage:String!
    let category:String!
    let userName:String!
    let isVerified:Bool!
    let time:String!
    let threadDesc:String!
    let likeCount:String!
    let retweetCount:String!
    let messageCount:String!
}

class HomeViewController: UIViewController {

    let thData:[TweetData] = [
            TweetData(userImage: "prof-img1", category: "Design", userName: "dheeraj_ks", isVerified: true, time: "10 min ago", threadDesc: "What do you think about this new gdevit UI??. It has a simpler and more attractive interface with the reasonable user experience. You basically have all what you need to see here.", likeCount: "52k", retweetCount: "30k", messageCount: "15k"),
            TweetData(userImage: "prof-img2", category: "3D", userName: "Sammy", isVerified: false, time: "14 min ago", threadDesc: "What do you think would be the best for rendering animation fast", likeCount: "15k", retweetCount: "10k", messageCount: "19k"),
            TweetData(userImage: "prof-img3", category: "Tech", userName: "Richard", isVerified: false, time: "14 min ago", threadDesc: "Lorem ipsum is simply dummy text of the printing and typesetting industry.", likeCount: "10k", retweetCount: "3k", messageCount: "1k"),
        ]
        
        lazy var categoryView:CategoryView = {
            let v = CategoryView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.mainController = self
            return v
        }()
        
        lazy var collectionView:UICollectionView = {
            let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
            layout.scrollDirection = .vertical
            let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.showsVerticalScrollIndicator = false
            cv.register(StoriesHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoriesHeaderCollectionReusableView")
            cv.register(ThreadCollectionViewCell.self, forCellWithReuseIdentifier: "ThreadCollectionViewCell")
            cv.backgroundColor = UIColor.dynamicColor(.appBackground1)
            cv.setCollectionViewLayout(layout, animated: false)
            cv.delegate = self
            cv.dataSource = self
            return cv
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.dynamicColor(.appBackground1)
            view.addSubview(categoryView)
            view.addSubview(collectionView)
            setUpConstraints()
            setUpCustomNavBar()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            let index = IndexPath(row: 0, section: 0)
            categoryView.collectionView.selectItem(at: index, animated: true, scrollPosition: .centeredVertically)
        }
        
        func setUpConstraints(){
            NSLayoutConstraint.activate([
                categoryView.topAnchor.constraint(equalTo: view.topAnchor),
                categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                categoryView.heightAnchor.constraint(equalToConstant: 70),
                
                collectionView.topAnchor.constraint(equalTo: categoryView.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        func setUpCustomNavBar(){
            
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.barTintColor = UIColor.dynamicColor(.appBackground1)
            navigationController?.navigationBar.isTranslucent = false
            
            //MARK:- search Button
            let searchButton = UIButton(type: .system)
            searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
            searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
            let rightBarButtonItem1 = UIBarButtonItem()
            rightBarButtonItem1.customView = searchButton
            
            //MARK:- inbox Button
            let inboxButton = UIButton(type: .system)
            inboxButton.setImage(UIImage(named: "inbox")?.withRenderingMode(.alwaysOriginal), for: .normal)
            inboxButton.addTarget(self, action: #selector(inboxPressed), for: .touchUpInside)
            inboxButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: inboxButton)
            let rightBarButtonItem2 = UIBarButtonItem()
            rightBarButtonItem2.customView = inboxButton
            
            navigationItem.setRightBarButtonItems([rightBarButtonItem2, rightBarButtonItem1], animated: true)
            
            //MARK:- userImage
            let userImage = UIImageView()
            userImage.image = UIImage(named: "navimg1")
            userImage.clipsToBounds = true
            userImage.contentMode = .scaleAspectFill
            userImage.layer.cornerRadius = 20
            userImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            
            let leftBarButtonItem1 = UIBarButtonItem()
            leftBarButtonItem1.customView = userImage
            
            //MARK:- Title
            let title = UILabel()
            title.text = " Threads"
            title.textColor = UIColor.dynamicColor(.textColor)
            title.font = UIFont(name: "Avenir-Heavy", size: 20)

            let leftBarButtonItem2 = UIBarButtonItem()
            leftBarButtonItem2.customView = title
            
            navigationItem.setLeftBarButtonItems([leftBarButtonItem1, leftBarButtonItem2], animated: true)
        }
        
        @objc func inboxPressed(){
            let VC = DiscussionViewController()
            navigationController?.pushViewController(VC, animated: true)
        }
    }

    extension HomeViewController:UICollectionViewDelegateFlowLayout , UICollectionViewDelegate, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return thData.count
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
                case UICollectionView.elementKindSectionHeader:
                    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StoriesHeaderCollectionReusableView", for: indexPath) as! StoriesHeaderCollectionReusableView
                    return header
                default:
                    return UICollectionReusableView()
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThreadCollectionViewCell", for: indexPath) as! ThreadCollectionViewCell
            cell.data = thData[indexPath.row]
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let desc = thData[indexPath.row].threadDesc
            let font = UIFont(name: "Avenir-Medium", size: 16)!
            let estimatedH = desc?.heightWithConstrainedWidth(width: (collectionView.frame.width - 60), font: font)
            return CGSize(width: collectionView.frame.width, height: 170 + estimatedH!)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 140)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
    }
