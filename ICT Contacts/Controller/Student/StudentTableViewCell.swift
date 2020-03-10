//
//  StudentTableViewCell.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentCellImg: UIImageView!
    
    @IBOutlet weak var studetnCellName: UILabel!
    
    @IBOutlet weak var studentCellDept: UILabel!
    
    @IBOutlet weak var studentCellSession: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

       // circleImage()
        
       
    }
    
    
    func circleImage(){
        
        studentCellImg.layer.borderWidth = 1.0
        studentCellImg.layer.masksToBounds = false
        studentCellImg.layer.borderColor = UIColor.black.cgColor
        studentCellImg.layer.cornerRadius = studentCellImg.frame.height/2
        studentCellImg.clipsToBounds = true

        
        
    }
  
    
    
    
    


}
