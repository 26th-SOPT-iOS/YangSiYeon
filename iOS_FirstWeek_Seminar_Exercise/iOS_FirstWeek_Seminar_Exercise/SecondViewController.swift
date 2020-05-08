//
//  SecondViewController.swift
//  iOS_FirstWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/04/18.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emiailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var name : String?
    var email :  String?
    var isOnOff : Bool?
    var frequency : Float?
    
    private func setLabels(){
        // Optional Binding
        // guard let은 optional을 깨서 확인을 하려고 하는 것
        guard let name = self.name else { return }
        guard let email = self.email else { return }
        guard let isOnOff = self.isOnOff else { return }
        guard let frequency = self.frequency else { return }
        
        // Label에 값 대입
        nameLabel.text = name
        emiailLabel.text = email
        switchLabel.text = isOnOff ? "On" : "Off"
        sliderLabel.text = "\(frequency)"
    }
    
    // 화면이 뜰 때 메모리에 올라가기 전에 불리는 함수 onCreate같은 것?
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
