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
    
    //usernameが入力されている場合はtrueになる
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ダークモード対応
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureLogoImageLabel()
        configureTextField()
        configureCallToActionButton()
        createDissmissKeyboardTapGesture()
    }
    
    //ナビゲーションバーを消去
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //キーボードの入力時、キーボード外を押した時に入力画面を消す
    func createDissmissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
        usernameTextField.delegate = self
        
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
        callToActionButton.addTarget(self, action: #selector(pushFollowerCollectionListVC), for: .touchUpInside)
          
          NSLayoutConstraint.activate([
              callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
              callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
              callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
              callToActionButton.heightAnchor.constraint(equalToConstant: 50)
          ])
      }

    @objc func pushFollowerCollectionListVC () {
        
        //画面遷移する前にtextFieldに文章が入っていない場合はアラートを出して次に進めないようにする
        guard isUsernameEntered else {
            presentQTAlertOnMainView(title: "名前が空欄です", message: "ユーザー名を入力してください", buttonTitle: "OK")
            return
        }
        let followerCollectionlistVC = FollowerCollectionListVC()
        followerCollectionlistVC.userName = usernameTextField.text
        followerCollectionlistVC.title = usernameTextField.text
        navigationController?.pushViewController(followerCollectionlistVC, animated: true)
    }
}

extension SearchFollowerVC: UITextFieldDelegate {
    //リターンが押された時には、キーボードで入力された情報を渡しながら画面遷移を実行
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerCollectionListVC()
        return true
    }
}
