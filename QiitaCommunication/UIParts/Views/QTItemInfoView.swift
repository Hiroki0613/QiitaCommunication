//
//  QTItemInfoView.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/22.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case itemsCount
    case permanentId
    case followers
    case following
}


class QTItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel = QTTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = QTTitleLabel(textAlignment: .center, fontSize: 14)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .itemsCount:
            symbolImageView.image = UIImage(systemName: SFsymbols.itemsCount)
            titleLabel.text = "投稿数"
        case .permanentId:
            symbolImageView.image = UIImage(systemName: SFsymbols.permanentId)
            titleLabel.text = "固有ID"
        case .followers:
            symbolImageView.image = UIImage(systemName: SFsymbols.followers)
            titleLabel.text = "フォロワーの数"
        case .following:
            symbolImageView.image = UIImage(systemName: SFsymbols.following)
            titleLabel.text = "フォローした数"
        }
        countLabel.text = String(count)
    }
}
