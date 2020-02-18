//
//  QTAlertVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QTAlertVC: UIViewController {

    //アラートを載せるviewを宣言
    let containerView = UIView()
    let titleLabel = QTTitleLabel(textAlignment: .center, fontSize: 30)
    let messageLabel = QTBodyLabel(textAlignment: .center)
    let actionButton = QTButton(backgroundColor: .systemRed, title: "戻る")
    
    //initで定義される内容を宣言、情報が入らない場合を想定してオプショナル型で宣言
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    //共通のpadding値を宣言
    var padding:CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //アラートを画面全体に暗めの透過背景にてポップアップして出す。
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.77)
        configureContainerView()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        //ダームモード対応
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "情報無し"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
}