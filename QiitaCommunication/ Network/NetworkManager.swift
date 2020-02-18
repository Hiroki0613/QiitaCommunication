//
//  NetworkManager.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class NetworkManager {
    //シングルトン
    static let shared = NetworkManager()
    private let baseURL = "https://qiita.com/api/v2/users/"
    
    private init(){}
    
}
