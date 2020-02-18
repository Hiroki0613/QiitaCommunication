//
//  UIViewController+Ext.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentQTAlertOnMainView(title: String,message: String, buttonTitle: String) {
        let alertVC = QTAlertVC(title: title, message: message, buttonTitle: buttonTitle)
    
        //アラートを画面全体にクロスディゾルブでポップアップして出す。
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true, completion: nil)
    }
}
