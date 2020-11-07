import UIKit
//code 
class CustomTabBarController: UITabBarController {

    func setTapBar() {
        guard let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenVC") as? GreenVC,
              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC else {
            return
        }
        greenVC.tabBarItem.image = UIImage(systemName: "house") //basic setting of tap bar item
        greenVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill") //if the image is selected
        greenVC.tabBarItem.title = "Home"
        blueVC.tabBarItem.image = UIImage(systemName: "person")
        blueVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        blueVC.tabBarItem.title = "Profile"
        //배열 안에 설정하고 싶은 뷰컨트롤러를 넣는다.
        setViewControllers([greenVC, blueVC], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapBar()

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
