//
//  MainVC.swift
//  movieEnjoy
//
//  Created by Hajin Jeong on 2020/07/21.
//  Copyright © 2020 AmazingHajin. All rights reserved.
//

import UIKit
import Firebase
import Moya
import SwiftyJSON

class MainVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var collection01: UICollectionView!
   
    var gradientLayer: CAGradientLayer!
    
    var movieProvider = MoyaProvider<MovieService>()
    var movieResult = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieProvider.request(.nowPlaying) { (result) in
            switch result {
            case .success(let response):
                let json = JSON(response.data)
                let stringValue = json["results"].arrayValue.map{$0["title"].stringValue}
                print(stringValue)

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
            
    
//        print(UserDefaults.standard.string(forKey: "token")!)
        
        collection01.register(CollectionViewCell01.nib(), forCellWithReuseIdentifier: CollectionViewCell01.identifier)
        collection01.register(CollectionViewCell02.nib(), forCellWithReuseIdentifier: CollectionViewCell02.identifier)
        collection01.register(CollectionViewCell03.nib(), forCellWithReuseIdentifier: CollectionViewCell03.identifier)
        collection01.register(CollectionHeaderView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        
        collection01.delegate = self
        collection01.dataSource = self
        
        
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
    
//    func parsing(kindOfData: MovieService, searchKeyword: String) -> Void {
//        movieProvider.request(kindOfData) { (result) in
//            switch result {
//            case .success(let response):
//                let json = JSON(response.data)
//                let stringValue = json["results"].arrayValue.map{$0[searchKeyword].stringValue}
//                self.getData01 = stringValue
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
    
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
    
    @IBAction func logOutBtnTap(_ sender: Any) {
        
        AlertService.confirmAlert(title: "로그아웃 하시겠습니까?", message: "", VC: self) { (_) in
            do {
                try Auth.auth().signOut()
                UserDefaults.standard.removeObject(forKey: "token")
                AlertService.confirmAlert02(title: "로그아웃 되었습니다", message: "첫 화면으로 돌아갑니다", VC: self) { (_) in
                    let goToMain = UIStoryboard(name: "Main", bundle: nil)
                    let VC = goToMain.instantiateViewController(identifier: "StartVC")
                    UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = VC
                }
            } catch let signOutError as NSError {
                print(signOutError, "signOutError")
            }
        }
    }


    
}

extension MainVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        } else if section == 1 {
//            parsing(kindOfData: .nowPlaying, searchKeyword: "title")
            return 4
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        if indexPath.section == 0 {
            let cell = collection01.dequeueReusableCell(withReuseIdentifier: CollectionViewCell01.identifier, for: indexPath) as! CollectionViewCell01
            
            
//            cell.img.image = UIImage(named: "")
            return cell
        } else if indexPath.section == 1 {
            let cell = collection01.dequeueReusableCell(withReuseIdentifier: CollectionViewCell02.identifier, for: indexPath) as! CollectionViewCell02
//            parsing(kindOfData: .nowPlaying, searchKeyword: "title")
//            cell.label01.text = getData01[indexPath.row]
            
            return cell
        }
        let cell = collection01.dequeueReusableCell(withReuseIdentifier: CollectionViewCell03.identifier, for: indexPath) as! CollectionViewCell03
        cell.label01.text = "제목"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("cell01")
        } else if indexPath.section == 1 {
            print("cell02")
        } else {
            print("cell03")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collection01.frame.width, height: 50)
        } else if section == 1 {
            return CGSize(width: collection01.frame.width, height: 50)
        }
        return CGSize(width: collection01.frame.width, height: 50)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header : CollectionHeaderView?
        
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0 {
                header = collection01.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView
                header?.backgroundColor = .systemGray3
                header?.label01.text = "Latest"
                return header!
            } else if indexPath.section == 1 {
                header = collection01.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView
                header?.backgroundColor = .systemGray3
                header?.label01.text = "Now Playing"
                return header!
            }
            header = collection01.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView
            header?.backgroundColor = .systemGray3
            header?.label01.text = "Popular"
        }
        return header!
        
            
    }
    
}


