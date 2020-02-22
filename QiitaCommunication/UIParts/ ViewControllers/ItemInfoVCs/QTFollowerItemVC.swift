//
//  QTFollowerItemVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QTFollowerItemVC: QTItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followersCount)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.followeesCount)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
}

