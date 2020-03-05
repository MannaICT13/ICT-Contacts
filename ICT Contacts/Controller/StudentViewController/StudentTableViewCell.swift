//
//  StudentTableViewCell.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var studentCellImg: UIView!
    
    @IBOutlet weak var studentCellName: UIView!
    
    @IBOutlet weak var studentCellDept: UIView!
    
    
    @IBOutlet weak var studentCellSession: UIView!
    
    @IBOutlet weak var studentCellYear: UIView!
    
    @IBOutlet weak var studentCellEmail: UIView!
    
    @IBOutlet weak var studentCellPhone: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


}
