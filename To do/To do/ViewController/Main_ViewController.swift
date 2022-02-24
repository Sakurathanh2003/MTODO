//
//  Main_ViewController.swift
//  To do
//
//  Created by Vu Thanh on 23/02/2022.
//

import UIKit

struct allData {
    var list: [List]
}


class Main_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var Data: [allData] = [
         allData.init(list: [
             List.init(name: "Ngày của tôi", icon: "sun.max", color: .systemOrange, listWork: []),
             List.init(name: "Quan trọng", icon: "star", color: .systemPink.withAlphaComponent(60), listWork: []),
             List.init(name: "Đã tập kế hoạch", icon: "calendar", color: .systemGreen, listWork: []),
             List.init(name: "Đã giao cho tôi", icon: "person", color: .systemBlue, listWork: []),
             List.init(name: "Tác vụ", icon: "house", color: .systemGray, listWork: [])
         ]),
         allData.init(list: [
             List.init(),
             List.init()
         ])
     ]
     
    var nextData: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
      //  navigationController?.navigationBar.prefersLargeTitles = false


    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationController?.navigationBar.isHidden = true
//    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? Detail_ViewController {
            controller.detailData = nextData
            
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Data[section].list.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell_TableViewCell

        // Configure the cell...
        let item = Data[indexPath.section].list[indexPath.row]
        
        cell.icon.image = UIImage.init(systemName: item.icon)?.withTintColor(item.colorIcon, renderingMode: .alwaysOriginal)
        cell.nameList.text = item.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = .gray
        return view
    }

   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextData = Data[indexPath.section].list[indexPath.row]
        navigationController?.navigationBar.tintColor = nextData?.colorIcon
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

