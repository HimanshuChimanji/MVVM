//
//  SongsVC.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 18/09/21.
//

import UIKit

class SongsVC: UIViewController {
    
    @IBOutlet weak var songsCollectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    
    let viewModal: SongsViewModal = SongsViewModal.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.loadHeaderView(self, title: "Home Screen",backButtonImage: nil)
        self.navigationController?.isNavigationBarHidden = true
        songsCollectionView.dataSource = self
        songsCollectionView.delegate = self
        songsCollectionView.register(UINib(nibName: "SongCVCell", bundle: nil), forCellWithReuseIdentifier: "SongCVCell")
        viewModal.callAPI(vc: self) { result in
            self.songsCollectionView.reloadData()
        }
        
    }
    
    
    
}

// MARK:- UICollectionView Methods
extension SongsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModal.songList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongCVCell", for: indexPath) as! SongCVCell
        cell.song = viewModal.songList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let songDetail = viewModal.songList[indexPath.row]
        self.navigationController?.pushViewController(SongDetailVC.init(val: songDetail), animated: false)
        
    }
    
    
}

extension SongsVC: HeaderViewDelegate {
    func backButtonAction() {
        print("Back Button Clicked")
    }
    
    
}
