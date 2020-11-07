//
//  AnimationVC.swift
//  sopt_week_4
//
//  Created by 우민지 on 2020/11/07.
//

import UIKit

class AnimationVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    func initPosition(){
        //이미지 뷰에 frame을 다 지운 상태로 돌려놓는 작업
        
        imageView.frame = CGRect(x: 87, y: 135, width: 240, height: 227)
    }
    
    @IBAction func touchUpStart(_ sender: Any) {
        
        let scale = CGAffineTransform(scaleX: 2.0, y: 2.0)
        let rotate = CGAffineTransform(rotationAngle: .pi/4)
        let move = CGAffineTransform(translationX: 200, y: 200)
        
        let combine = scale.concatenating(move).concatenating(rotate)
        
        self.imageView.transform = combine
//        UIView.animate(withDuration: 2.0, animations: {
//            self.imageView.alpha = 0
//        }) //set up the duration time of animation
      
//        UIView.animate(withDuration: 2.0, animations: {
//            self.imageView.alpha = 0 //transparent
//            self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
//        }) { (finish) in UIView.animate(withDuration: 1.0, animations: {
//            self.imageView.alpha = 1
//            self.initPosition()
//        }) { (finished) in
//            if finished {
//                print("finished")
//            }
//        }
//
//        }
//
//        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.3, options: .curve, animations: , completion: T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void)
        
        UIView.animate(withDuration: 2.0, animations: {
//            self.imageView.transform = CGAffineTransform(scaleX: 2.0, y: 0.5) // 높이가 줄어들고! 넓이가 늘어남 곱해준 값이 들어간다?
           // self.imageView.transform = CGAffineTransform(translationX: 100.0, y: 300) //x 좌표로 얼마만큼 이동하고 싶은지~
            
            //self.imageView.transform = CGAffineTransform(rotationAngle: .pi / 2) //회전값
            
            self.imageView.transform = combine
        }) { finish in UIView.animate(withDuration: 1.0) {
            self.imageView.transform = .identity
        }
            
        }
        //제약 조건에 상관없이 이동시킬 수 있다.
        
        
        
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
