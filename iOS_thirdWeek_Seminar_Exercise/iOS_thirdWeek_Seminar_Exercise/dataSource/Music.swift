//
//  Music.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/06/11.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName: String, title: String, singer: String){
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}
