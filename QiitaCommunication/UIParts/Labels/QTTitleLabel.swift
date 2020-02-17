//
//  QTTitleLabel.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/17.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class QTTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //TitleLabelを作成する時に自由に設定できるプロパティを定義
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    //決定しているプロパティ
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
