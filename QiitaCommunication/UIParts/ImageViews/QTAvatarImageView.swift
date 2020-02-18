//
//  QTAvatarImageView.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QTAvatarImageView: UIImageView {

    //プレースホルダーを宣言
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
