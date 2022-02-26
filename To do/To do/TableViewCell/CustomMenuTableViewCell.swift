//
//  CustomMenuTableViewCell.swift
//  To do
//
//  Created by Vu Thanh on 26/02/2022.
//

import UIKit

class CustomMenuTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        return view
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 10, width: 30, height: 30))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var lbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 60, y: 10, width: self.frame.width, height: 30))
        lbl.font = UIFont(name: "System", size: 17.0)
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        addSubview(backView)
        backView.addSubview(image)
        backView.addSubview(lbl)
    }

}
