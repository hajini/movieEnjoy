//
//  SignInVC.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/19.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    var gradientLayer : CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        self.gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.gradientLayer.colors = [UIColor.init(red: 184/255, green: 129/255, blue: 249/255, alpha: 1.0).cgColor, UIColor.init(red: 84/255, green: 90/255, blue: 233/255, alpha: 1.0).cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
        
        //background image
        let image = UIImage(named: "backImg04")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)
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
