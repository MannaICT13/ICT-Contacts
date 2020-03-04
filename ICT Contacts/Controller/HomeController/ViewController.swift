//
//  ViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentBtn: UIButton!
    
    @IBOutlet weak var teaherBtn: UIButton!
    
    @IBOutlet weak var officeStaffBtn: UIButton!
    
    @IBOutlet weak var aboutBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentBtn.layer.cornerRadius = 10
        teaherBtn.layer.cornerRadius = 10
        officeStaffBtn.layer.cornerRadius = 10
        aboutBtn.layer.cornerRadius = 10
        
       
    }

    @IBAction func studentBtnAction(_ sender: UIButton) {
    
        let studentVC = self.storyboard?.instantiateViewController(identifier: "StudentViewController") as! StudentViewController
        self.navigationController?.pushViewController(studentVC, animated: true)
        
     //   performSegue(withIdentifier: "segue", sender: nil)
        
        
      
    }
   
    
    @IBAction func teacherBtnAction(_ sender: UIButton) {
    }
    
    @IBAction func officeStaffBtnAction(_ sender: UIButton) {
    }
    
    @IBAction func aboutBtnAction(_ sender: UIButton) {
    }
}

