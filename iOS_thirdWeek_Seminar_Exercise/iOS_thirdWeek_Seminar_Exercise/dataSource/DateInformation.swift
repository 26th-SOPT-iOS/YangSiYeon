//
//  DateInformation.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/06/11.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

struct DateInformation {
    var weather : Weather
    var date: String
    var subTitle: String
    
    init(weather : Weather, date: String, subTitle: String){
        self.weather = weather
        self.date = date
        self.subTitle = subTitle
    }
    
    enum Weather {
        case cloudy
        case rainny
        case snowy
        case sunny
        func getImageName() -> String {
            switch self {
            case .cloudy: return "weather-cloudy"
            case .rainny: return "weather-rainny"
            case .snowy: return "weather-snowy"
            case .sunny: return "weather-sunny"
            }
        }
    }

}
