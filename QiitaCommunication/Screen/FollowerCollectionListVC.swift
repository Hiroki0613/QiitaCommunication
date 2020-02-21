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
    
    //userNameはSearchFollowerVCから受け取る
    var userName: String!
    var followers: [Follower] = []
    var filteredFollowers: [Follower] = []
    var isSearching = false
    
    //初期のフォロワー情報を取得するページを1と宣言
    var page = 1
    //パージする時に100個以上の情報があるかどうかを確認
    var hasMoreFollowers = true
    
    var qtCollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSearchController()
        configureCollectionView()
        getFollowers(username: userName, page: page)
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
        qtCollectionView.delegate = self
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
    
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "フォロワーを絞り込みます"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    
    func getFollowers(username: String,page: Int) {
        showLoadingView()
        NetworkManager.shared.getFollowers(for: userName, page: page) { (followers, errorMessage) in
            guard let followers = followers else {
               
                self.presentQTAlertOnMainView(title: "ユーザー名が無効です", message: errorMessage!.rawValue, buttonTitle: "OK")
                return
            }
             self.dismissLoadingView()
            
            if followers.count < 100 {
                self.hasMoreFollowers = false
            }
            
            self.followers.append(contentsOf: followers)
            
            if self.followers.isEmpty {
                let message = "このユーザーには\nフォロワーがいません"
                DispatchQueue.main.async {
                    self.showEmptyStateView(with: message, in: self.view)
                    return
                }
            }
            
            self.initDataSource(on: self.followers)

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
    
    
    func initDataSource(on followers: [Follower]) {
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

extension FollowerCollectionListVC: UICollectionViewDelegate {
    
    //スクロールビューで一番下に達した時に、次の100個のフォロワーを呼び出す
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //どれぐれいスクロールダウン出来るかの高さ
        let offsetY = scrollView.contentOffset.y
        //100人のフォロワーをスクロールする高さ
        let contentHeight = scrollView.contentSize.height
        //該当のiPhoneの高さ
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page = page + 1
            getFollowers(username: userName, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredFollowers : followers
        let follower = activeArray[indexPath.item]
    }
}


extension FollowerCollectionListVC:  UISearchResultsUpdating,UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        isSearching = true
        //$0はfollowerの行列を表す、小文字を単体と認識してフィルターをかける。合致しているものをfilteredFollowersに入れる
        filteredFollowers = followers.filter { $0.id.lowercased().contains(filter.lowercased())}
        initDataSource(on: filteredFollowers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        initDataSource(on: followers)
    }
}
