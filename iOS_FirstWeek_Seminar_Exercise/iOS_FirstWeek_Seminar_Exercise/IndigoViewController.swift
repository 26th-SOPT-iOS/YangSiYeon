//
//  IndigoViewController.swift
//  iOS_FirstWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/04/18.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class IndigoViewController: UIViewController {

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
    
    // sender: 버튼 객체라고 생각하면 된다.
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
