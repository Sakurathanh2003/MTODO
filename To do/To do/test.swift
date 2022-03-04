//
//  test.swift
//  To do
//
//  Created by Vu Thanh on 04/03/2022.
//

import UIKit

class testhu: UIViewController {
    
    @IBOutlet weak var backGroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        backGroundView.backgroundColor = UIColor.init(white: 0.3, alpha: 0.4)
    }
}
