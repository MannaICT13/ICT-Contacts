//
//  StudentDetailTableViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 8/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class StudentDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var studentNameLbl: UILabel!
    
    @IBOutlet weak var studentDeptLbl: UILabel!
    
    @IBOutlet weak var studentSessionLbl: UILabel!
    
    @IBOutlet weak var studentYearLbl: UILabel!
    
    @IBOutlet weak var studentEmailLbl: UILabel!
    
    @IBOutlet weak var studentPhoneLbl: UILabel!
    
    
    var studentData : Student?
     
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
                     

    }

    override func viewWillAppear(_ animated: Bool) {
        
                   studentNameLbl.text = studentData?.name
                   studentDeptLbl.text = studentData?.dept
                   studentSessionLbl.text  = studentData?.session
                   studentYearLbl.text = studentData?.year
                   studentEmailLbl.text = studentData?.email
                   studentPhoneLbl.text = studentData?.phone
    }

  

}
