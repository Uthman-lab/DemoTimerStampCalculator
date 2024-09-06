//
//  DateHelper.swift
//  DemoTimerStampCalculator
//
//  Created by AMALITECH-PC-593 on 9/6/24.
//

import Foundation

class DateHelper {
    private init() {}
    
    static  func format(date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm ss a"
        return dateFormater.string(from: date)
    }
}
