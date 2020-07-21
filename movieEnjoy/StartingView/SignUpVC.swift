//
//  SignUpVC.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/19.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit
import FirebaseAuth
import TextFieldEffects

class SignUpVC: UIViewController {

    @IBOutlet var nameTxtFld: TextFieldEffects!
    @IBOutlet var emailTxtFld: TextFieldEffects!
    @IBOutlet var passwordTxtFld: TextFieldEffects!
    @IBOutlet var confirmTxtFld: TextFieldEffects!
    
    @IBOutlet weak var createAccBtn: UIButton!
    
    var gradientLayer : CAGradientLayer!
    
    //키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
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
        let image = UIImage(named: "backImg03")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)
        
        //center image
        let centerImage = UIImage(named: "enjoy")
        let centerImageView = UIImageView(image: centerImage!)
        centerImageView.frame = CGRect(x: self.view.bounds.size.width/2-75, y: self.view.bounds.size.height/4-34.5, width: 150, height: 69)
        self.view.addSubview(centerImageView)
        
        // main Image and Text
        let label01 = UILabel()
        label01.text = "Create your Account"
        label01.textAlignment = .center
        label01.font = UIFont(name: label01.font.fontName, size: 18)
        label01.numberOfLines = 0
        label01.frame = CGRect(x: self.view.bounds.size.width/2-88, y: self.view.bounds.size.height/4+70, width: 177, height: 22)
        label01.textColor = .white
        self.view.addSubview(label01)
        
        // text Filed align
        let textField01 = TextFieldOption.fixedOption(textField: nameTxtFld, placeholder: "Full name", frame: nameTxtFld.frame)
        textField01.frame = CGRect(x: 15, y: label01.frame.midY+50, width: self.view.frame.size.width-30, height: 40)
        textField01.bounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width-30, height: 48)
        self.view.addSubview(textField01)

        let textField02 = TextFieldOption.fixedOption(textField: emailTxtFld, placeholder: "E-mail address", frame: emailTxtFld.frame)
        textField02.frame = CGRect(x: 15, y: textField01.frame.midY+30, width: self.view.frame.size.width-30, height: 40)
        textField02.bounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width-30, height: 48)
        self.view.addSubview(textField02)

        let textField03 = TextFieldOption.fixedOption(textField: passwordTxtFld, placeholder: "Password", frame: passwordTxtFld.frame)
        textField03.frame = CGRect(x: 15, y: textField02.frame.midY+30, width: self.view.frame.size.width-30, height: 40)
        textField03.bounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width-30, height: 48)
        textField03.isSecureTextEntry = true
        self.view.addSubview(textField03)

        let textField04 = TextFieldOption.fixedOption(textField: confirmTxtFld, placeholder: "Confirm password", frame: confirmTxtFld.frame)
        textField04.frame = CGRect(x: 15, y: textField03.frame.midY+30, width: self.view.frame.size.width-30, height: 40)
        textField04.bounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width-30, height: 48)
        textField04.isSecureTextEntry = true
        self.view.addSubview(textField04)
        
//        self.view.addSubview(nameTxtFld)
//        self.view.addSubview(emailTxtFld)
//        self.view.addSubview(passwordTxtFld)
//        self.view.addSubview(confirmTxtFld)
        
        createAccBtn.frame = CGRect(x: self.view.frame.size.width/2-(195/2), y: self.view.frame.size.height-200, width: 195, height: 76)
        createAccBtn.setTitle("Create Account", for: .normal)
        createAccBtn.setTitleColor(.white, for: .normal)
        let backImg = UIImage(named: "CreateAccBtn")
        createAccBtn.setBackgroundImage(backImg, for: .normal)
        self.view.addSubview(createAccBtn)
        
        
        
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
    
    @IBAction func createAccBtnTap(_ sender: Any) {
        // Firebase Auth service
        print()
        
        if nameTxtFld.text! == "" || emailTxtFld.text! == "" || passwordTxtFld.text! == "" || confirmTxtFld.text! == "" {
               AlertService.errAlert(title: "정보 입력이 부족합니다", message: "빈칸을 확인해 주세요", VC: self, handler: nil)
           } else {
               Auth.auth().createUser(withEmail: emailTxtFld.text!, password: passwordTxtFld.text!) { (result, err) in
                   if err != nil {
                    AlertService.errAlert(title: "오류", message: "\(err!.localizedDescription)", VC: self, handler: nil)
                      
                   } else {
                    
                    AlertService.confirmAlert02(title: "가입이 완료되었습니다", message: "메인페이지로 로그인합니다", VC: self) { (_) in
                        print(result.debugDescription, "created")
                        let goToMain = UIStoryboard(name: "LoggedMain", bundle: nil)
                        let VC = goToMain.instantiateViewController(identifier: "MainVC")
                        UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
                    }
                }
                   
               }
           }
    }
}
