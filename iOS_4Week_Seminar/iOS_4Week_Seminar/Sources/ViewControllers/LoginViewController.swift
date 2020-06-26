//
//  LoginViewController.swift
//  iOS_4Week_Seminar
//
//  Created by 양시연 on 2020/06/26.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func login(_ sender: Any) {
        guard let inputId = idTextField.text else {return}
        guard let inputPWD = pwTextField.text else {return}
        
       LoginService.shared.login(id: inputId, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                    guard let token = token as? String else { return }
                    UserDefaults.standard.set(token, forKey: "token")
                    guard let tabbarController = self.storyboard?.instantiateViewController(identifier:

        "customTabbarController") as? UITabBarController else { return }
                    tabbarController.modalPresentationStyle = .fullScreen
                    self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message,

        preferredStyle: .alert)

                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
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
