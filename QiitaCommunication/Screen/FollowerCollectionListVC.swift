//
//  FollowerCollectionListVC.swift
//  QiitaCommunication
//
//  Created by 近藤宏輝 on 2020/02/18.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import UIKit

class FollowerCollectionListVC: UIViewController {
    
    //セクションの数を定義
    enum Section {
        case main
    }
    
    var userName: String!
    var followers: [Follower] = []
    
    var qtCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        getFollowers()
        configureDataSource()
    }
    
    
    //ナビゲーションバーを表示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
 
    
    func configureCollectionView() {
        qtCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(qtCollectionView)
        qtCollectionView.backgroundColor = .systemBackground
        qtCollectionView.register(QTFollowerCell.self, forCellWithReuseIdentifier: QTFollowerCell.reuseID)
    }
    
    
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth/3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        //avatarImageとusernameを入れるため、高さは+40を追加している
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentQTAlertOnMainView(title: "ユーザー名が無効です", message: errorMessage!.rawValue, buttonTitle: "OK")
                return
            }
            self.followers = followers
            self.initDataSource()

        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: qtCollectionView, cellProvider: { (collectionView, indePath, follower) -> UICollectionViewCell? in
            /// セルの値を設定する
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QTFollowerCell.reuseID, for: indePath) as! QTFollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    
    func initDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        /// セクションを登録、今回は一つ
        snapshot.appendSections([.main])
        /// アイテムを登録
        snapshot.appendItems(followers)
        /// データを反映
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
    }
}
