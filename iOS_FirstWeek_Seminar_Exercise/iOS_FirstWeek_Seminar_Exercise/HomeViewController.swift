//
//  HomeViewController.swift
//  iOS_FirstWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/05/08.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var email: String?
    var password: String?
    
    private func setLabels(){
        // Optional Binding
        // guard let은 optional을 깨서 확인을 하려고 하는 것
        guard let email = self.email else { return }
        guard let password = self.password else { return }
       
        // Label에 값 대입
        emailLabel.text = email
        passwordLabel.text = password
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setLabels()
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
