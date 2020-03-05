//
//  StudentViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var student = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    


}
extension StudentViewController : UITableViewDataSource,UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : StudentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
        cell.sImg.image = UIImage(data: student[indexPath.row].img!)
        cell.studentCellName
        
        
        return cell
        
    }
    
    
    
    
    
    
}
