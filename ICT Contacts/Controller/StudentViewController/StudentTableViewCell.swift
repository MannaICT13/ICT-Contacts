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
    
    @IBOutlet weak var studentCellYear: UILabel!
    
    
    @IBOutlet weak var studentCellEmail: UILabel!
    
    @IBOutlet weak var studentCellPhone: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }


}
