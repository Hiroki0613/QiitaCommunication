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

        print(username!)

    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    

}
