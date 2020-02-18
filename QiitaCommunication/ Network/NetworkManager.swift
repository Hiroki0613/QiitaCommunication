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
    
    
    //参考URL
    //https://qiita.com/api/v2/users/qiita/followers?page=1&per_page=100
    func getFollowers(for username: String, page: Int,completed: @escaping ([Follower]?, String?)-> Void) {
        let endpoint = baseURL + "\(username)/followers?page=\(page)&per_page=100"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "このURLは無効です、もう一度確認してください")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if let _ = error {
                completed(nil, "リクエストが完了しませんでした。もう一度確認してください")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "サーバーからのレスポンスが無効です。もう一度確認してください")
                return
            }
            
            guard let data = data else {
                completed(nil, "サーバーからのデータが無効です。もう一度確認してください")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //キャメルケース→キャメルケースに変更
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil,"サーバーから受け取ったデータは無効です。もう一度確認してください")
            }
        }
        task.resume()
    }
    
    
}
