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
        view.backgroundColor = .systemBackground
        configureLogoImageView()
    }
    
    //ロゴのイメージの設置場所
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "Qiita")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }


}
