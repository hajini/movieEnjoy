//
//  SignUpVC.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/19.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnTap(_ sender: Any) {
        let goToBack = UIStoryboard(name: "Main", bundle: nil)
        let VC = goToBack.instantiateViewController(identifier: "StartVC")
        UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
    }
    
}
