//
//  FirstYearViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class FirstYearViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFirstYearStudent(_ :)))
    }
    
    
    
    @objc func addFirstYearStudent(_ sender : UIBarButtonItem){
        
        let addFirstYearVC = self.storyboard?.instantiateViewController(identifier: "AddFirstYearStudentViewController") as! AddFirstYearStudentViewController
        self.navigationController?.pushViewController(addFirstYearVC, animated: true)
        
    }


}
