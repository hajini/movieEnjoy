//
//  CollectionViewCell03.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/30.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class CollectionViewCell03: UICollectionViewCell {

    @IBOutlet weak var label01: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    static let identifier = "PopularCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell03", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .systemBlue
    }

}
