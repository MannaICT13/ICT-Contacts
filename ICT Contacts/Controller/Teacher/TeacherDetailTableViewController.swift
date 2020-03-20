//
//  TeacherDetailTableViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 11/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import MessageUI
class TeacherDetailTableViewController: UITableViewController {
    

    @IBOutlet weak var teacherDetailNameLbl: UILabel!
    
    @IBOutlet weak var teacherDetailDesignationLbl: UILabel!
    
    @IBOutlet weak var teacherDetailEmailLbl: UILabel!
    
    
    @IBOutlet weak var teacherDetailPhoneLbl: UILabel!
    
    var teacherDetail : Teacher?
    var rowIndex = Int()
    
    let mailController = MFMailComposeViewController()
    let msgController = MFMessageComposeViewController()
    
    
    
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 2 {
            
            let alertController = UIAlertController(title: "Alert Information!", message: "You want to send mail?", preferredStyle: .actionSheet)
            let sendMail = UIAlertAction(title: "Send Mail", style: .default) { (mailAction) in
                
                print("Mail Sending......")
                self.createMailCompose()
            }
            
            alertController.addAction(sendMail)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }
    }
    


}

extension TeacherDetailTableViewController  : MFMailComposeViewControllerDelegate {
    
    
    
    private func createMailCompose(){
        
        if MFMailComposeViewController.canSendMail(){
            
             mailController.mailComposeDelegate = self
             mailController.setToRecipients([teacherDetailEmailLbl.text!])
             //mailController.setCcRecipients(<#T##ccRecipients: [String]?##[String]?#>)
             //mailController.setSubject(<#T##subject: String##String#>)
            // mailController.setMessageBody(<#T##body: String##String#>, isHTML: )
            
            self.present(mailController, animated: true, completion: nil)
            
        }else{
            return
        }
        
        
        
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            self.dismiss(animated: true, completion: nil)
        }
        
        
        
        switch result {
             
            
        case .sent :
            print("mail sent")
            
        case .saved :
            print("mail saved")
            
        case .failed :
            print("mail failed")
            
        case .cancelled :
            print("cancled")
            
        default:
            fatalError()
            
            
        }
        
        
        
        
    }
    
    
    
    
    
}
extension TeacherDetailTableViewController : MFMessageComposeViewControllerDelegate{
    
    
    private func teacherCallSetUp() {
        
        
        guard let callingUrl = NSURL(string: "TEL://\(teacherDetailPhoneLbl.text!)") else {
            return
        }
        
        UIApplication.shared.open(callingUrl as URL, options: [:], completionHandler: nil)
        
        
        
    }
    private func teacherSmsSetup(){
        
        if MFMessageComposeViewController.canSendText(){
          
            msgController.messageComposeDelegate  = self
            msgController.recipients = [teacherDetailPhoneLbl.text!]
           // msgController.body
            self.present(msgController, animated: true, completion: nil)
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
        case .sent:
            print("sent")
        case .failed :
            print("failed")
        case .cancelled :
            print("canceled")
        default:
            fatalError()
        }
        
    }
    
}
