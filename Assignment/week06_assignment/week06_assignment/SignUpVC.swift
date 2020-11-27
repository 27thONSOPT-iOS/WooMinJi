//
//  SignUpVC.swift
//  week06_assignment
//
//  Created by 우민지 on 2020/11/27.
//

import UIKit

class SignUpVC: UIViewController {

    static let identifier:String = "SignUpVC"
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    func signUpAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    
    }
    
    
    
    @IBAction func touchSignUp(_ sender: Any) {
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let userName = userNameTextField.text else {
            return
        }
        
        AuthService.shared.signUp(email: email, password: password, userName: userName) {
            (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let signUpData = data as? SignUpData {
                    self.signUpAlert(title: "회원가입 성공", message: "\(signUpData.userName)님 회원가입을 축하드립니다.")
                }
                print(networkResult)
                
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.signUpAlert(title: "회원가입 실패", message: message)
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
