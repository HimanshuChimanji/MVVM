//
//  SongDetailVC.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 19/09/21.
//

import UIKit

class SongDetailVC: UIViewController {
    
    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var collectionNameLbl: UILabel!
    @IBOutlet weak var genreNameLbl: UILabel!
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    
    
    let viewModal: SongDetailViewModal = SongDetailViewModal.instance
    
    // (DI)
    init(val: SongsStruct) {
        viewModal.songDetail = val
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.loadHeaderView(self, title: "Song Detail", backButtonImage: #imageLiteral(resourceName: "BackButton"))
        self.songNameLbl.text = viewModal.songDetail?.trackName ?? ""
        self.artistNameLbl.text = viewModal.songDetail?.artistName ?? ""
        self.collectionNameLbl.text = viewModal.songDetail?.collectionName ?? ""
        self.genreNameLbl.text = viewModal.songDetail?.primaryGenreName ?? ""
        if let imageURLString = viewModal.songDetail?.artworkUrl100 {
            if  let imageURL = URL(string: imageURLString) {
                self.trackImage.sd_setImage(with: imageURL, completed: nil)
            }
        }
    }
}
extension SongDetailVC: HeaderViewDelegate{
    func backButtonAction() {
        self.navigationController?.popViewController(animated: false)
    }
    
    
}
