//
//  StudentViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var firstYearBtn: UIButton!
    
    @IBOutlet weak var secondYearBtn: UIButton!
    
    @IBOutlet weak var thirdYearBtn: UIButton!
    
    @IBOutlet weak var fourthYearBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstYearBtn.layer.cornerRadius = 10
        secondYearBtn.layer.cornerRadius = 10
        thirdYearBtn.layer.cornerRadius = 10
        fourthYearBtn.layer.cornerRadius = 10

       
    }
    
    @IBAction func firstYearAction(_ sender: UIButton) {
        let firstVC = self.storyboard?.instantiateViewController(identifier: "FirstYearViewController") as! FirstYearViewController
        self.navigationController?.pushViewController(firstVC, animated: true)
        
    }
    
    @IBAction func secondYearAction(_ sender: UIButton) {
    }
    
    @IBAction func thirdYearAction(_ sender: UIButton) {
    }
    
    @IBAction func fourthYearAction(_ sender: UIButton) {
    }
    

    


}
