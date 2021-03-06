//
//  Follower.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

//Followerを取得するためのModel
//参考URL
//https://qiita.com/api/v2/users/qiita/followers?page=1&per_page=100


//codableとhashableで定義
struct Follower: Codable, Hashable {
//    var name: String
    var id: String
    var profileImageUrl: String
}
