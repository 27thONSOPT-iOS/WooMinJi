//
//  ViewController.swift
//  week06_assignment
//
//  Created by 우민지 on 2020/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func touchSignUp(_ sender: Any) {
        
        guard let svc = storyboard?.instantiateViewController(identifier: SignUpVC.identifier) as? SignUpVC else {
            return
        }
        
        self.present(svc, animated: true)
    }
    
    func simpleAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpLogin(_ sender: Any) {
        //textfield 입력값 저장
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text else {
            return
        }
        
        //정의해둔 싱글톤 객체를 통해 데이터 통신
        AuthService.shared.signIn(email: emailText, password: passwordText) { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let signInData = data as? SignInData {
                    self.simpleAlert(title: "로그인 성공", message: "\(signInData.userName)님 로그인 하셨습니다. ")
                    UserDefaults.standard.set(signInData.userName, forKey: "userName")
                }
                //print(networkResult)
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "로그인 실패", message: message)
                }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
        
    }
    
}

