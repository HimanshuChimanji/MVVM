//
//  SongsVC.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 18/09/21.
//

import UIKit

class SongsVC: UIViewController {
    
    @IBOutlet weak var songsCollectionView: UICollectionView!
    
    let viewModal: SongsViewModal = SongsViewModal.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        songsCollectionView.dataSource = self
        songsCollectionView.register(UINib(nibName: "SongCVCell", bundle: nil), forCellWithReuseIdentifier: "SongCVCell")
        viewModal.callAPI(vc: self) { result in
            self.songsCollectionView.reloadData()
        }
        
    }
    
    
    
}

// MARK:- UICollectionView Methods
extension SongsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModal.songList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongCVCell", for: indexPath) as! SongCVCell
        cell.song = viewModal.songList[indexPath.row]
        return cell
    }
    
    
}
