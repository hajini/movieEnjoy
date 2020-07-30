//
//  CollectionViewCell03.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/30.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class CollectionViewCell03: UICollectionViewCell {

    static let identifier = "PopularCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell03", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .blue
    }

}
