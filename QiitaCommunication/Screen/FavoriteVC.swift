//
//  FavoriteVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/17.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class FavoriteVC: UIViewController {

    let tableView = UITableView()
    var favorites: [Follower] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "お気に入り"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(QTFavoriteCell.self, forCellReuseIdentifier: QTFavoriteCell.reuseID)
    }
    
    
    func getFavorites() {
        PresistenceManager.retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                self.favorites = favorites
            case .failure(let error):
                break
            }
        }
    }
}


extension FavoriteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QTFavoriteCell.reuseID, for: indexPath) as! QTFavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    
    
}
