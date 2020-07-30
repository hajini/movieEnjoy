//
//  CollectionHeaderView.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/30.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    @IBOutlet weak var label01: UILabel!
    
    static let identifier = "HeaderView"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionHeaderView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
