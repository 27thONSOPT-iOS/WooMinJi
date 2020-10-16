//
//  LoginVC.swift
//  sopt_week1_freemjstudio
//
//  Created by 우민지 on 2020/10/16.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var part: UITextField!
    @IBOutlet weak var name: UITextField!
    
    //dismiss the presented VC
    //back to login page
    @IBAction func backBtn(_ sender: Any) {
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        // 값 전달하기
        ad?.paramPart = self.part.text
        ad?.paramName = self.name.text
        
        self.presentingViewController?.dismiss(animated: true)
        
    }
    //next page push

    
    @IBAction func signUpBtn(_ sender: Any) {
        guard let svc = self.storyboard?.instantiateViewController(identifier: "SignUpVC") else {
            return
        }
        self.navigationController?.pushViewController(svc, animated: true)
    }
    
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

}
