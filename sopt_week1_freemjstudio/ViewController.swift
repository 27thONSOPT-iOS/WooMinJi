//
//  ViewController.swift
//  sopt_week1_freemjstudio
//
//  Created by 우민지 on 2020/10/16.
//

import UIKit

//present 방식으로 화면 전환하기

class ViewController: UIViewController {

    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
        
    //로그인 하러 가기 btn
    @IBAction func nextBtn(_ sender: Any) {
        
        // lvc 객체 생성
        let lvc = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC") // 강제 unwrapping 해주는 이유
        
        self.present(lvc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let part = ad?.paramPart {
            partLabel.text = part
        }
        
        if let name = ad?.paramName {
            nameLabel.text = "\(name)님 안녕하세요 !"
        }
    
    }
    
}

