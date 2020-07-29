//
//  SignInVC.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/19.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit
import TextFieldEffects
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var emailTxtFld: HoshiTextField!
    @IBOutlet weak var passTxtFld: HoshiTextField!
    @IBOutlet weak var logInBtn: UIButton!
    
    var gradientLayer : CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.backGroundView.bounds
        self.gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        self.gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.gradientLayer.colors = [UIColor.init(red: 184/255, green: 129/255, blue: 249/255, alpha: 1.0).cgColor, UIColor.init(red: 84/255, green: 90/255, blue: 233/255, alpha: 1.0).cgColor]
        self.backGroundView.layer.addSublayer(self.gradientLayer)
        
        //background image
        let image = UIImage(named: "logInImg")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)
        
        // log in button
        logInBtn.frame = CGRect(x: self.view.frame.size.width/2-(195/2), y: self.view.frame.size.height-200, width: 195, height: 76)
        logInBtn.setTitle("Log In", for: .normal)
        logInBtn.setTitleColor(.white, for: .normal)
        let backImg = UIImage(named: "CreateAccBtn")
        logInBtn.setBackgroundImage(backImg, for: .normal)
        self.view.addSubview(logInBtn)
        
        passTxtFld.isSecureTextEntry = true
        
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
    @IBAction func logInBtnTap(_ sender: Any) {
        
        guard let email = emailTxtFld.text, !email.isEmpty,
            let pass = passTxtFld.text, !pass.isEmpty else {
                AlertService.errAlert(title: "정보 입력이 부족합니다", message: "빈칸을 확인해 주세요", VC: self, handler: nil)
                return
        }
        
        Auth.auth().signIn(withEmail: emailTxtFld.text!, password: passTxtFld.text!) { (result, err) in
            if err != nil {
                AlertService.errAlert(title: "오류", message: "\(err!.localizedDescription)", VC: self, handler: nil)
            } else {
                let currentUser = Auth.auth().currentUser
                currentUser?.getIDTokenForcingRefresh(true, completion: { (string, err) in
                    if err != nil {
                        AlertService.errAlert(title: "오류", message: "\(err!.localizedDescription)", VC: self, handler: nil)
                    } else {
                        UserDefaults.standard.set(string!, forKey: "token")
                        let goToMain = UIStoryboard(name: "LoggedMain", bundle: nil)
                        let VC = goToMain.instantiateViewController(identifier: "MainVC")
                        UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
                    }
                
                })
            }
        
        }
        
    }
    
}
