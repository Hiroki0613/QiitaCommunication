//
//  SearchFollowerVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/17.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class SearchFollowerVC: UIViewController {

    let logoImageView = UIImageView()
    let logoImageLabel = QTBodyLabel(textAlignment: .center)
    let usernameTextField = QTTextField()
    let callToActionButton = QTButton(backgroundColor: .systemBlue, title: "フォロワーの検索")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    


}
