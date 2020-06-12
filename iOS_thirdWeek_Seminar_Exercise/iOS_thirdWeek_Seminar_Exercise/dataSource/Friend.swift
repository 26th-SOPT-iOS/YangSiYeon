//
//  Friend.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/06/12.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

struct Friend {
    var profileImage: String
    var userName: String
    var message: String?
    
    init(image: String, name: String, message: String){
        self.profileImage = image
        self.userName = name
        self.message = message
    }
}

