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
    let logoImageLabel = QTTitleLabel(textAlignment: .center, fontSize: 20)
    let usernameTextField = QTTextField()
    let callToActionButton = QTButton(backgroundColor: .systemBlue, title: "フォロワーの検索")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ダークモード対応
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureLogoImageLabel()
        configureTextField()
        configureCallToActionButton()
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

    //ロゴの下に記載するコピー
    func configureLogoImageLabel() {
        view.addSubview(logoImageLabel)
        logoImageLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageLabel.text = "さあ、Followerを検索してみよう"
        
        NSLayoutConstraint.activate([
            logoImageLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            logoImageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoImageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //フォロワーを検索するTextField
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageLabel.bottomAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    //FollowerListVCへ移動するボタン
    func configureCallToActionButton(){
          view.addSubview(callToActionButton)
          
          NSLayoutConstraint.activate([
              callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
              callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
              callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
              callToActionButton.heightAnchor.constraint(equalToConstant: 50)
          ])
      }

    


}
