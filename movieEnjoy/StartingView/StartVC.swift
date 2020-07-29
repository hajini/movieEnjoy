//
//  StartVC.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/17.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit
import Firebase

class StartVC: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
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
        let image = UIImage(named: "backImg02")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(imageView)
        
        //center image
        let centerImage = UIImage(named: "enjoy")
        let centerImageView = UIImageView(image: centerImage!)
        centerImageView.frame = CGRect(x: self.view.bounds.size.width/2-75, y: self.view.bounds.size.height/4-34.5, width: 150, height: 69)
        self.view.addSubview(centerImageView)
        
        // main Image and Text
        let label01 = UILabel()
        label01.text = "Book your movie ticket anytime,\nanywhere with enjoy"
        label01.textAlignment = .center
        label01.font = UIFont(name: label01.font.fontName, size: 18)
        label01.numberOfLines = 0
        label01.frame = CGRect(x: self.view.bounds.size.width/2-121, y: self.view.bounds.size.height/4+70, width: 242, height: 44)
        label01.textColor = .white
        self.view.addSubview(label01)
        
        // Buttons
        
        signInBtn.layer.cornerRadius = 10
        signInBtn.backgroundColor = .white
        signInBtn.setTitleColor(.black, for: .highlighted)
        self.view.bringSubviewToFront(signInBtn)
        
        signUpBtn.layer.borderWidth = 2
        signUpBtn.layer.cornerRadius = 10
        signUpBtn.layer.borderColor = UIColor.white.cgColor
        self.view.bringSubviewToFront(signUpBtn)
        
        
        let label02 = UILabel()
        label02.text = "By clicking Create, you will create an account and agree to\nours Terms of Service and Privacy Policy"
        label02.textAlignment = .center
        label02.font = UIFont(name: label01.font.fontName, size: 10)
        label02.numberOfLines = 0
        label02.frame = CGRect(x: self.view.bounds.size.width/2-145.5, y: self.view.bounds.size.height-50, width: 291, height: 28)
        label02.textColor = .white
        self.view.addSubview(label02)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signInBtnTap(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
            let goToMain = UIStoryboard(name: "LoggedMain", bundle: nil)
            let VC = goToMain.instantiateViewController(identifier: "MainVC")
            UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
        } else {
            let goToSignIn = UIStoryboard(name: "Main", bundle: nil)
            let VC = goToSignIn.instantiateViewController(identifier: "signInVC")
            UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
        }
        
    }
    
    @IBAction func signUpBtnTap(_ sender: Any) {
        let goToSignUp = UIStoryboard(name: "Main", bundle: nil)
        let VC = goToSignUp.instantiateViewController(identifier: "signUpVC")
        UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
    }
    
}
