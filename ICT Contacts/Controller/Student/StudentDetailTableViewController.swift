//
//  StudentDetailTableViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 8/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import MessageUI
class StudentDetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var studentNameLbl: UILabel!
    
    @IBOutlet weak var studentDeptLbl: UILabel!
    
    @IBOutlet weak var studentSessionLbl: UILabel!
    
    @IBOutlet weak var studentYearLbl: UILabel!
    
    @IBOutlet weak var studentEmailLbl: UILabel!
    
    @IBOutlet weak var studentPhoneLbl: UILabel!
    
    
    var studentData : Student?
    
    var Rowindex = Int()
 
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target:self, action: #selector(editStudentData(_ :)))
                     

    }

    override func viewWillAppear(_ animated: Bool) {
        
    
                   studentNameLbl.text = studentData?.name
                   studentDeptLbl.text = studentData?.dept
                   studentSessionLbl.text  = studentData?.session
                   studentYearLbl.text = studentData?.year
                   studentEmailLbl.text = studentData?.email
                   studentPhoneLbl.text = studentData?.phone
        
        
        
        
        
        
        
    }
    
    
    @objc func editStudentData( _ sender : UIBarButtonItem){
        
    
               let editStudentVc = self.storyboard?.instantiateViewController(identifier: "AddStudentViewController") as! AddStudentViewController
        
                editStudentVc.editStudentData = studentData
                editStudentVc.isUpdate = true
                editStudentVc.Rowindex = Rowindex
               self.navigationController?.pushViewController(editStudentVc, animated: true)
        
        
    }
   

}
extension StudentDetailTableViewController{
    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.row == 4{
            
            let alertController = UIAlertController(title: "Alert Information", message: "You want to send a mail?", preferredStyle: .actionSheet)
            let mail = UIAlertAction(title: "Send Mail", style: .default) { (mailAction) in
                print("Mail Sending")
            }
            alertController.addAction(mail)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            
            self.present(alertController, animated: true, completion: nil)
            
            
            
            
        }
        
        if indexPath.row == 5{
            
            let alertController = UIAlertController(title: "Alert information", message: "You want to communicate?", preferredStyle: .actionSheet)
            
            let call = UIAlertAction(title: "Call", style: .default) { (callAction) in
                print("Calling....")
            }
            alertController.addAction(call)
            let sms = UIAlertAction(title: "Sms", style: .default) { (smsAction) in
                print("Sms sending.....")
            }
            alertController.addAction(sms)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            
            self.present(alertController, animated: true, completion: nil)
            
           
        }
    }
    
}

extension StudentDetailTableViewController{
    
    
    
    
    
    
    
    
}
