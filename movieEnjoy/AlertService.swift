//
//  AlertService.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/21.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import Foundation
import UIKit

class AlertService {
    static func errAlert(title: String, message: String, VC: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAct01 = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(alertAct01)
        
        VC.present(alert, animated: true, completion: nil)
    }
    
    static func confirmAlert(title: String, message: String, VC: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAct01 = UIAlertAction(title: "확인", style: .default, handler: handler)
        let alertAct02 = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(alertAct01)
        alert.addAction(alertAct02)
        
        VC.present(alert, animated: true, completion: nil)
    }
    
    static func confirmAlert02(title: String, message: String, VC: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAct01 = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(alertAct01)
        
        VC.present(alert, animated: true, completion: nil)
    }
    
    
}
