//
//  ChatViewController.swift
//  Demo
//
//  Created by user259867 on 5/8/24.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var msgTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var array :[String] = []
    var name : String = ""
    var photoname : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        nameLabel.text = name
        photo.image = UIImage(named: photoname)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }

  
    @IBAction func sendPRessed(_ sender: UIButton) {
        array.append(msgTextField.text!)
        tableView.reloadData()
    }
    
}
