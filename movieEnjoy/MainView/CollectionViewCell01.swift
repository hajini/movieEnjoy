//
//  CollectionViewCell01.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/30.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class CollectionViewCell01: UICollectionViewCell {

    @IBOutlet weak var label01: UILabel!
    
    static let identifier = "LatestCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell01", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label01.text = "label0101010"
        backgroundColor = .red
        
    }

}
