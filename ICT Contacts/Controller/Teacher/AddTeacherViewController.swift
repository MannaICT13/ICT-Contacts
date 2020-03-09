//
//  AddTeacherViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 10/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import CoreData

class AddTeacherViewController: UIViewController {
    
    
    @IBOutlet weak var teacherImg: UIImageView!
    
    @IBOutlet weak var teacherName: UITextField!
    
    @IBOutlet weak var teacherDesignation: UITextField!
    
    @IBOutlet weak var teacherEmail: UITextField!
    
    @IBOutlet weak var teacherPhone: UITextField!
    
    
    
    
    @IBOutlet weak var teacherSaveBtnOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func teacherSaveBtnAction(_ sender: Any) {
        
        
        let teacherJpgImg = teacherImg.image?.jpegData(compressionQuality: 0.20)
        let _ = teacherImg.image?.pngData()
        
        
        
        let teacherDic : [String : Any] = ["teacherImg":teacherJpgImg! ,"teacherName":teacherName.text!,"teacherEmail":teacherEmail.text!,"teacherPhone":teacherPhone.text!]
       
       TeacherDatabaseHelper.teacherInstance.saveTeacherData(obj: teacherDic)
        
        
        
    }
    

}
