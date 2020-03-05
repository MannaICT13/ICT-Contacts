//
//  AddStudentViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

    
    @IBOutlet weak var studentImg: UIImageView!
    
    @IBOutlet weak var studentName: UITextField!
    
    @IBOutlet weak var studentDept: UITextField!
    
    @IBOutlet weak var studentSession: UITextField!
    
    @IBOutlet weak var studentYear: UITextField!
    
    @IBOutlet weak var studentEmail: UITextField!
    
    @IBOutlet weak var studentPhone: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func studentSaveAction(_ sender: UIButton) {
        
        
        let _ = self.studentImg.image?.jpegData(compressionQuality: 0.75)
        let pngStudentImg = self.studentImg.image?.pngData()
        
        
        
        
        let studentDic : [String : Any] = ["pngStudentImg":pngStudentImg!,"studentName":studentName! ,"studentDept":studentDept! ,"studentSession":studentSession!,"studentYear":studentYear!,"studentEmail": studentEmail! ,"studentPhone":studentPhone!]
        
     //   StudentDatabaseHelper.studentInstance.saveStudentData(data: studentDic)
        
        
        
    }
    
    
    
    
}
