//
//  DetailList_TableViewController.swift
//  To do
//
//  Created by Vu Thanh on 22/02/2022.
//

import UIKit

class DetailList_TableViewController: UITableViewController {
    
    @IBOutlet weak var nameList: UILabel!
    @IBOutlet weak var time: UILabel!
 
    @IBOutlet weak var but: UIButton!
    
    var detailData : List?
    
    
    @IBAction func hh(_ sender: Any) {
        print("hello")
        if (but.tintColor == .gray){
            but.setImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
            but.tintColor = detailData?.colorIcon
        } else {
            but.setImage(UIImage(systemName: "circle"), for: .normal)
            but.tintColor = .gray
        }
        
    }
    
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
        nameList.text = detailData?.name
        time.text = "\(dayName), \(dayOfMonth) tháng \(month)"
        
        nameList.textColor = detailData?.colorIcon
        time.textColor = detailData?.colorIcon
        
        but.tintColor = .gray
                
    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
