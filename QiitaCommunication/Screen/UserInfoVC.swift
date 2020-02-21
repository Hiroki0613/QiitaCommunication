//
//  UserInfoVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/21.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
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
        

    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    

}
