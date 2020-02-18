//
//  FollowerCollectionListVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class FollowerCollectionListVC: UIViewController {
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentQTAlertOnMainView(title: "何かエラーが発生しています", message: errorMessage!, buttonTitle: "OK")
                return
            }
            
            print("フォロワーの数 = \(followers.count)")
            print(followers)
        }

    }
    
    //ナビゲーションバーを表示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

 

}
