//
//  NetworkResult.swift
//  iOS_4Week_Seminar
//
//  Created by 양시연 on 2020/06/26.
//  Copyright © 2020 양시연. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
