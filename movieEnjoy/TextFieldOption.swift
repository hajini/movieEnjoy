//
//  TextFieldOption.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/21.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import Foundation
import UIKit
import TextFieldEffects

class TextFieldOption {
    static func fixedOption(textField: UITextField, placeholder: String, frame: CGRect) -> UITextField {
        let textField01 = HoshiTextField(frame: frame)
        textField01.placeholder = placeholder
        textField01.borderActiveColor = .systemGray3
        textField01.borderInactiveColor = .white
        textField01.placeholderColor = .white
        textField01.placeholderFontScale = 0.8
        textField01.autocapitalizationType = .none
        textField01.autocorrectionType = .no
        
        return textField01
    }
}
