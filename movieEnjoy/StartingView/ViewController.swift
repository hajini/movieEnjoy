//
//  ViewController.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/17.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // background gradient color
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        self.gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.gradientLayer.colors = [UIColor.init(red: 184/255, green: 129/255, blue: 249/255, alpha: 1.0).cgColor, UIColor.init(red: 84/255, green: 90/255, blue: 233/255, alpha: 1.0).cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
        
        //background image
        let image = UIImage(named: "backImg01")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)

        //center image
        let centerImage = UIImage(named: "enjoy")
        let centerImageView = UIImageView(image: centerImage!)
        centerImageView.frame = CGRect(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2, width: 216, height: 99)
        self.view.addSubview(centerImageView)
        
        
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            
            let goToNext = UIStoryboard(name: "Main", bundle: nil)
            let VC = goToNext.instantiateViewController(withIdentifier: "StartVC")
            UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
        }
        
        
    }
        
    


}

