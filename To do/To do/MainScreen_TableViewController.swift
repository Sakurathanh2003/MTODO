//
//  MainScreen_TableViewController.swift
//  To do
//
//  Created by Vu Thanh on 22/02/2022.
//

import UIKit

struct allData {
    var list: [List]
}

class MainScreen_TableViewController: UITableViewController {
    
   var Data: [allData] = [
        allData.init(list: [
            List.init(name: "Ngày của tôi", icon: "sun.max", color: .systemOrange, listWork: []),
            List.init(name: "Quan trọng", icon: "star", color: .systemPink.withAlphaComponent(60), listWork: []),
            List.init(name: "Đã tập kế hoạch", icon: "calendar", color: .systemGreen, listWork: []),
            List.init(name: "Đã giao cho tôi", icon: "person", color: .systemBlue, listWork: []),
            List.init(name: "Tác vụ", icon: "house", color: .systemGray, listWork: [])
        ]),
        allData.init(list: [
            List.init()
        ])
    ]
    
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Data[section].list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell_TableViewCell

        // Configure the cell...
        let item = Data[indexPath.section].list[indexPath.row]
        
        cell.icon.image = UIImage.init(systemName: item.icon)?.withTintColor(item.colorIcon, renderingMode: .alwaysOriginal)
        cell.nameList.text = item.name

        return cell
    }
    

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
