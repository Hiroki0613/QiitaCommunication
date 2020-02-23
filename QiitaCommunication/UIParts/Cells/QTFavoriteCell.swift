//
//  QTFavoriteCell.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/23.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QTFavoriteCell: UITableViewCell {

 //reuseIDを宣言
   static let reuseID = "QTFavoriteCell"
   
    let avatarImageView = QTAvatarImageView(frame: .zero)
    let usernameLabel = QTTitleLabel(textAlignment: .left, fontSize: 26)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //cellForRowAtに入れる情報
    func set(favorite: Follower) {
        usernameLabel.text = favorite.id
        avatarImageView.downLoadImage(from: favorite.profileImageUrl)
    }
    
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
}
