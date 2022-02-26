//
//  SettingMenu.swift
//  To do
//
//  Created by Vu Thanh on 26/02/2022.
//

import UIKit

class SettingMenu: NSObject, UITableViewDelegate, UITableViewDataSource {
   
    
    
    var menu = UIView()
    var tableView = UITableView()
    var haiz = UIView()
    
    func onMenu(_ view: UIView) {
        self.haiz = view
        menu.backgroundColor = .black.withAlphaComponent(0.5)
        menu.frame = view.frame
        
        tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 250)
        
        
        
        view.addSubview(menu)
        view.addSubview(tableView)
        
        let tapGestureReconzi = UITapGestureRecognizer(target: self, action: #selector(returnMain))
        menu.addGestureRecognizer(tapGestureReconzi)
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
            self.menu.alpha = 0.5
            self.tableView.frame = CGRect(x: 0, y: (view.frame.height) - 250, width: view.frame.width , height: 250)
        }, completion: nil)
    }
    @objc func returnMain(){
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
            self.menu.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: self.haiz.frame.height, width: self.haiz.frame.width, height: 250)
        }, completion: nil)
        
    }
    
    override init() {
        super.init()
        // start doing something here
        
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomMenuTableViewCell.self, forCellReuseIdentifier: "menuCell")
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! CustomMenuTableViewCell
        
        cell.lbl.text = "Hello"
        cell.image.image = UIImage(systemName: "heart.fill")
        
        return cell
    }
}
