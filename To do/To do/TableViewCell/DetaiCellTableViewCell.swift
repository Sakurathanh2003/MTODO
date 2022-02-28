//
//  DetaiCell_TableViewCell.swift
//  To do
//
//  Created by Vu Thanh on 23/02/2022.
//

import UIKit

class DetaiCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var nameWork: UILabel!
    @IBOutlet weak var nameList: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        cell.backgroundColor = UIColor.white
//            cell.layer.borderColor = UIColor.black.cgColor
//                cell.layer.borderWidth = 1
//                cell.layer.cornerRadius = 8
//                cell.clipsToBounds = true
        
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 20
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        
        //label
        self.nameWork.textColor = .black
        self.nameList.textColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
