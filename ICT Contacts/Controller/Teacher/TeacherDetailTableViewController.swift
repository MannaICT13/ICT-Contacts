//
//  TeacherDetailTableViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 11/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class TeacherDetailTableViewController: UITableViewController {
    

    @IBOutlet weak var teacherDetailNameLbl: UILabel!
    
    @IBOutlet weak var teacherDetailDesignationLbl: UILabel!
    
    @IBOutlet weak var teacherDetailEmailLbl: UILabel!
    
    
    @IBOutlet weak var teacherDetailPhoneLbl: UILabel!
    
    var teacherDetail : Teacher?
    var rowIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTeacherData))
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
         
             teacherDetailNameLbl.text = teacherDetail?.name
             teacherDetailDesignationLbl.text = teacherDetail?.designation
             teacherDetailEmailLbl.text = teacherDetail?.email
             teacherDetailPhoneLbl.text = teacherDetail?.phone
        
    }
    
  @objc func editTeacherData(){
        
    let addTeacherVC = self.storyboard?.instantiateViewController(identifier: "AddTeacherViewController") as! AddTeacherViewController
     addTeacherVC.editTeacherDetail = teacherDetail
     addTeacherVC.isUpdate = true
    addTeacherVC.rowIndex = rowIndex
   
   
 
    
    self.navigationController?.pushViewController(addTeacherVC, animated: true)
    
        
        
        
    }
    
    
    


}
