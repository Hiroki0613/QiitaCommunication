//
//  User.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/21.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

//Userを取得するためのModel
//参考URL
//https://qiita.com/api/v2/users/qiita

struct User: Codable{
    var id: String
    var profileImageUrl: String
    var name: String?
    var location: String?
    var description: String?
    var itemsCount: Int
    var permanentID: Int
    var websiteUrl: String
    var followersCount: String
    var followeesCount: String
    
}
