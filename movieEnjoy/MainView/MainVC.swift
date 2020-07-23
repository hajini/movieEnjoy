//
//  MainVC.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/21.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var backGroundView: UIView!
    
    
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.backGroundView.bounds
        self.gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        self.gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.gradientLayer.colors = [UIColor.init(red: 184/255, green: 129/255, blue: 249/255, alpha: 1.0).cgColor, UIColor.init(red: 84/255, green: 90/255, blue: 233/255, alpha: 1.0).cgColor]
        self.backGroundView.layer.addSublayer(self.gradientLayer)

        let image01 = UIImage(named: "backImg05")
        let imageView01 = UIImageView(image: image01!)
        imageView01.frame = backImg.frame
        self.view.addSubview(imageView01)
        
        let image02 = UIImage(named: "backImg06")
        let imageView02 = UIImageView(image: image02!)
        imageView02.frame = profileImg.frame
        self.view.addSubview(imageView02)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func menuBtnTap(_ sender: Any) {
    }
    
}
