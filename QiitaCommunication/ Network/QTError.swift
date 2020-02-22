//
//  ErrorMessage.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation

enum QTError: String, Error {
    case invalidUsername = "このユーザー名は無効です"
    case unableToComplete = "リクエストが完了しませんでした。"
    case invalidResponse = "サーバーからのレスポンスが無効です。"
    case invalidData = "サーバーからのデータが無効です。"
    case unableToFavorite = "お気に入りに追加する際にエラーが発生しました"
    case alreadyInFavorites = "すでにお気に入りに入っています"
    
}
