//
//  QTItemsCountVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QTItemsCountVC: QTItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .itemsCount, withCount: user.itemsCount)
        itemInfoViewTwo.set(itemInfoType: .permanentId, withCount: user.permanentId)
        actionButton.set(backgroundColor: .systemPurple, title: "プロフィールページを表示")
    }
    
    override func actionButtonTapped() {
        delegate.didTapQiitaProfile(for: user)
    }
}
