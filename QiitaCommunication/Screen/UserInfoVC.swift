//
//  UserInfoVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/21.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit
import SafariServices

protocol UserInfoVCDelegate {
    func didTapQiitaProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    var itemViews: [UIView] = []
    
    var username: String!
    var delegate: FollowerCollectionListVCDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func getUserInfo() {
        NetworkManager.shared.getUsersInfo(for: username) { result in
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(with: user)
                }
            case .failure(let error):
                self.presentQTAlertOnMainView(title: "ユーザー名が無効です", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    
    func configureUIElements(with user: User) {
        let itemCountVC = QTItemsCountVC(user: user)
        itemCountVC.delegate = self
        
        let followerItemVC = QTFollowerItemVC(user: user)
        followerItemVC.delegate = self
        
        self.add(childVC: QTUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: itemCountVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
    }
    
    
    func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        itemViews = [headerView, itemViewOne, itemViewTwo]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
  
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    
    //childVCを追加
    func add(childVC: UIViewController,to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}


extension UserInfoVC: UserInfoVCDelegate {
    func didTapQiitaProfile(for user: User) {
        let qiitaProfileString = "https://qiita.com/\(user.id)"
        guard let qiitaProfileURL = URL(string: qiitaProfileString) else {
            presentQTAlertOnMainView(title: "無効URL", message: "このユーザーアカウントは無効です", buttonTitle: "OK")
            return
        }
       
        //safariでqiitaのプロフィールページを表示
        let safariVC = SFSafariViewController(url: qiitaProfileURL)
        safariVC.preferredControlTintColor = .systemBlue
        present(safariVC, animated: true, completion: nil)
    }
    
    func didTapGetFollowers(for user: User) {
        guard user.followersCount != 0 else {
            presentQTAlertOnMainView(title: "No followers", message: "このアカウントにはフォロワーがいません", buttonTitle: "OK")
            return
        }
        delegate.didRequestFollowers(for: user.id)
        dismissVC()
    }
}
