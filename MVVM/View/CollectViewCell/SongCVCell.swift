//
//  SongCVCell.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 18/09/21.
//

import UIKit
import SDWebImage
class SongCVCell: UICollectionViewCell {
    @IBOutlet weak var songTumbnail: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    
    var song: SongsStruct? {
        didSet {
            songTitle.text = song?.trackName ?? ""
            if let imageURLString = song?.artworkUrl60 {
                if  let imageURL = URL(string: imageURLString) {
            songTumbnail.sd_setImage(with: imageURL, completed: nil)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
