//
//  LoginViewController.swift
//  iOS_FirstWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/05/08.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func trasferData(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "homeViewController") as? HomeViewController else { return }
               
            receiveViewController.email = emailTextField.text
            receiveViewController.password = passwordTextField.text
              
            self.present(receiveViewController, animated: true, completion: nil)
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
