//
//  Detail_ViewController.swift
//  To do
//
//  Created by Vu Thanh on 23/02/2022.
//

import UIKit

class Detail_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var detailData : List?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get Todays Date
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
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //nameList.text = detailData?.name
       // time.text = "\(dayName), \(dayOfMonth) tháng \(month)"
        
       // nameList.textColor = detailData?.colorIcon
       // time.textColor = detailData?.colorIcon
        
       
        // Set large title for navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
        // thay đổi tên title cho navigation bar
        navigationItem.title = detailData?.name
        // thay đổi màu cho title navigation bar
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: detailData?.colorIcon]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: detailData?.colorIcon]
        tableView.backgroundColor = UIColor.clear
        
        
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
// MARK: Table View Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
        
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetaiCell_TableViewCell
            
        cell.nameList?.text = "Hello"
        cell.nameWork?.text = "kk"
        
        return cell
    }
    
   
    
}
