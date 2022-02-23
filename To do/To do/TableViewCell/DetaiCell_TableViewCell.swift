//
//  DetaiCell_TableViewCell.swift
//  To do
//
//  Created by Vu Thanh on 23/02/2022.
//

import UIKit

class DetaiCell_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var nameWork: UILabel!
    @IBOutlet weak var nameList: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
