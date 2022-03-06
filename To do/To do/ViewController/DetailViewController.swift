//
//  Detail_ViewController.swift
//  To do
//
//  Created by Vu Thanh on 23/02/2022.
//

import UIKit



class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewWorkView: UIView!
    @IBOutlet weak var addNameWorkTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
   
    var detailData : List?
    var openMenu = SettingMenu()
    var frameAddNew: CGRect!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.frameAddNew = addNewWorkView.frame
        
        //
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
                
        
        addNewWorkView.layer.cornerRadius = 10
        addNewWorkView.clipsToBounds = true
        
        //
        addNameWorkTextField.isHidden = true
        checkButton.isHidden = true
        // Get Todays Date
        
        
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //nameList.text = detailData?.name
        
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
        
        //
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
       
        observeKeyBoard()
        addNameWorkTextField.delegate = self
        if (detailData?.name == "Đã giao cho tôi"){
            addNewWorkView.isHidden = true
        }
       
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = false
//    }
//
// MARK: Table View Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (detailData?.listTask.count)!
    }
        
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetaiCellTableViewCell
            
        let item = detailData?.listTask[indexPath.row]
        cell.nameList?.text = item?.nameList
        cell.nameTask?.text = item?.nameTask
        
        cell.checkBox.tag = indexPath.row
        cell.checkBox.addTarget(self, action: #selector(tick), for: .touchUpInside)
        
        return cell
    }
    
    @objc func tick(_ sender : UIButton){
        let indexPath = IndexPath(row: sender.tag, section: 0)
        var item = detailData?.listTask[indexPath.row]
        print("\(item!.nameTask!)")
    
        if (item?.finish == false){
            item?.finish = true
            sender.setImage(UIImage(systemName: "circle.fill")?.withTintColor(detailData!.colorIcon, renderingMode: .alwaysOriginal), for: .normal)
            print("hihi")
        } else {
            item?.finish = false
            sender.setImage(UIImage(systemName: "circle")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
            print("hihi1")
        }
        
        
        
        
    }
    
    
    @IBAction func onMenu(_ sender: Any) {
        openMenu.onMenu(self.view)
    }
    
    
    @IBAction func clickAddButton(_ sender: Any) {
        self.addButton.isHidden = true
        self.checkButton.isHidden = false
        self.addNameWorkTextField.isHidden = false
        
        
    }
    
    
    private func observeKeyBoard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // khi bàn phím hiện
    @objc func keyBoardWillShow( _ notification : Notification ){
        let keyBoardHeight = getHeightKeyBoard(notification: notification)
        
        self.addNewWorkView.frame = CGRect(x: frameAddNew.minX, y: frameAddNew.minY - keyBoardHeight + (view.frame.height - frameAddNew.maxY), width: frameAddNew.width, height: frameAddNew.height)
        
    }
    
    
    // khi bàn phím ẩn
    @objc func keyBoardWillHidden( _ notification: Notification){
        let keyBoardHeight = getHeightKeyBoard(notification: notification)
        self.addNewWorkView.frame = frameAddNew
    }
    
    // lấy chiều cao của bàn phím
    private func getHeightKeyBoard(notification: Notification) -> CGFloat{
        guard let keyBoardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey ] as? NSValue)?.cgRectValue.height else { return 0}
        return keyBoardHeight
    }
    
    
    
}

extension DetailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  addNameWorkTextField.text != nil {
            let nameNewTask: String = textField.text!
            detailData?.listTask.append(Task(nameList: detailData!.name, nameTask: nameNewTask))
          tableView.reloadData()
        }
        
        print("hello")
    }
    
    
}
