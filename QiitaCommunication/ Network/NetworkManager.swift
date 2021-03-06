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
    //キャッシュを宣言
    let cache = NSCache<NSString, UIImage>()
    
    private init(){}
    
    
    //参考URL
    //https://qiita.com/api/v2/users/qiita/followers?page=1&per_page=100
    func getFollowers(for username: String, page: Int,completed: @escaping (Result<[Follower], QTError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?page=\(page)&per_page=100"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //キャメルケース→キャメルケースに変更
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    //参考URL
    //https://qiita.com/api/v2/users/qiita
    func getUsersInfo(for username: String,completed: @escaping (Result<User, QTError>) -> Void) {
        let endpoint = baseURL + "\(username)"
//        let endpoint = "https://qiita.com/api/v2/users/qiita"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //キャメルケース→キャメルケースに変更
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
}
