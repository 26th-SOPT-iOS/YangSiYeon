//
//  DetailViewController.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/06/11.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    var weatherImage : String = ""
    var date: String = ""
    var subTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    private func initView(){
        weatherImageView.image = UIImage(named: weatherImage)
        dateLabel.text = date
        subTitleLabel.text = subTitle
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
