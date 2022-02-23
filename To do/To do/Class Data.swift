//
//  Class Data.swift
//  To do
//
//  Created by Vu Thanh on 22/02/2022.
//

import Foundation
import UIKit

class List{
    var name: String = "Danh sách chưa có tên"
    var icon: String = "list.bullet"
    var colorIcon: UIColor! = .systemIndigo
    
    var listWork: [Work] = []
    
    init(name: String, icon: String, color: UIColor, listWork: [Work]){
        self.name = name
        self.icon = icon
        self.colorIcon = color
        self.listWork = listWork
    }
    
    init(){
        self.name = "Danh sách chưa có tên"
        self.icon = "list.bullet"
        self.colorIcon = .systemIndigo
        self.listWork = []
    }
}

func TransFormVietnamese(thu: String) -> String {
    switch thu {
    case "Monday":
        return "Thứ hai"
    case "Tuesday":
        return "Thứ ba"
    case "Wednesday":
        return "Thứ tư"
    case "Thursday":
        return "Thứ năm"
    case "Friday":
        return "Thứ sáu"
    case "Saturday":
        return "Thứ bảy"
    default:
        return "Chủ nhật"
    }
}
