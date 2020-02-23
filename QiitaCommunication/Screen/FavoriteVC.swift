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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
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
        PresistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                //お気に入りが無い場合が０の時に表示
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "お気に入りがありません\nフォロワーリストから追加してください。", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
            case .failure(let error):
                self.presentQTAlertOnMainView(title: "問題が発生しましt", message: error.rawValue, buttonTitle: "OK")
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
