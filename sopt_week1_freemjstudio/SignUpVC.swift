//
//  SignUpVC.swift
//  sopt_week1_freemjstudio
//
//  Created by 우민지 on 2020/10/16.
//

import UIKit

class SignUpVC: UIViewController {

    
    @IBAction func submitBtn(_ sender: Any) {
        //화면 pop 시키기
        self.navigationController?.popViewController(animated: true)
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
