//
//  UserInfoVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/21.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        
        NetworkManager.shared.getUsersInfo(for: username) { (user, errorMessage) in
            guard let user = user else {
                self.presentQTAlertOnMainView(title: "ユーザー名が無効です", message: errorMessage!.rawValue, buttonTitle: "OK")
                return
            }
            print(user)
        }
        
        layoutUI()
    }
    
    
    func layoutUI() {
        view.addSubview(headerView)
        headerView.backgroundColor = .systemPink
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    

}
