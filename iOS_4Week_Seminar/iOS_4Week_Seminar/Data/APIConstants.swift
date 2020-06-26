//
//  APIConstants.swift
//  iOS_4Week_Seminar
//
//  Created by 양시연 on 2020/06/26.
//  Copyright © 2020 양시연. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
