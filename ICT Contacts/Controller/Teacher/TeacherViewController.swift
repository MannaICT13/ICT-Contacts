//
//  TeacherViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 10/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class TeacherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var teacher = [Teacher]()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTeacher( _ : )))
        teacher = TeacherDatabaseHelper.teacherInstance.retriveTeacherData()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
          teacher = TeacherDatabaseHelper.teacherInstance.retriveTeacherData()
          tableView.reloadData()
    }
    
    @objc func addTeacher(_ sender : UIBarButtonItem){
        
        let addVC = self.storyboard?.instantiateViewController(identifier: "AddTeacherViewController") as! AddTeacherViewController
        self.navigationController?.pushViewController(addVC, animated: true)
        
        
        
    }
    

}
extension TeacherViewController : UITableViewDataSource,UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teacher.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherTableViewCell") as! TeacherTableViewCell
        cell.tecaherImgCell.image = UIImage(data : teacher[indexPath.row].img!)
        cell.teacherNameLblCell.text = teacher[indexPath.row].name
        cell.teacherDesignationCell.text = teacher[indexPath.row].designation
        
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            self.teacher.remove(at: indexPath.row)
            TeacherDatabaseHelper.teacherInstance.daleteTeacherData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete])
        config.performsFirstActionWithFullSwipe = false
        return config
        
        
    
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let teacherDetailVC = self.storyboard?.instantiateViewController(identifier: "TeacherDetailTableViewController") as! TeacherDetailTableViewController
        
          teacherDetailVC.teacherDetail = teacher[indexPath.row]
          teacherDetailVC.rowIndex =  indexPath.row
        
        self.navigationController?.pushViewController(teacherDetailVC, animated: true)
        
    }
    
    
    
    
    
    
    
    
    
}


