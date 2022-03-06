//
//  NSData+Extensions.swift
//  To do
//
//  Created by Vu Thanh on 05/03/2022.
//

import Foundation

extension NSData{
    static func date() -> String {
        let date = NSDate()
        var dateFormatter = DateFormatter()
        
        // định dạng thứ: EEEE
        dateFormatter.dateFormat = "EEEE"
        var dayName: String = dateFormatter.string(from: date as Date)
        dayName = TransFormVietnamese(thu: dayName)
        
        // định dạng ngày: dd
        dateFormatter.dateFormat = "dd"
        let dayOfMonth: String = dateFormatter.string(from: date as Date)
        
        // định dạng tháng: MM
        dateFormatter.dateFormat = "MM"
        let month: String = dateFormatter.string(from: date as Date)
        
        
        let time: String =  "\(dayName), \(dayOfMonth) tháng \(month)"
        return time
    }
}
