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

      
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStudent(_ : )))
        
       self.view.backgroundColor = UIColor.black
        
        self.student = StudentDatabaseHelper.studentInstance.getStudentData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.student = StudentDatabaseHelper.studentInstance.getStudentData()
           
       }
   
    
    @objc func addStudent(_ sender : UIBarButtonItem){
        
        let addStudentVc = self.storyboard?.instantiateViewController(identifier: "AddStudentViewController") as! AddStudentViewController
        self.navigationController?.pushViewController(addStudentVc, animated: true)
        
        
    }


}


extension StudentViewController : UITableViewDataSource,UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : StudentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
        cell.studentCellImg.image = UIImage(data: student[indexPath.row].img!)
        cell.studetnCellName.text = student[indexPath.row].name
        cell.studentCellDept.text = student[indexPath.row].dept
        cell.studentCellSession.text = student[indexPath.row].session
        cell.studentCellYear.text = student[indexPath.row].year
        cell.studentCellEmail.text = student[indexPath.row].email
        cell.studentCellPhone.text = student[indexPath.row].phone
        
        cell.backgroundColor = UIColor.black
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view
            , nil) in
            
    
            
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, nil) in
            
            
        }
        
        
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        config.performsFirstActionWithFullSwipe = false
        
        return config
        
        
        
    }
    
    
    
    
    
    
}
