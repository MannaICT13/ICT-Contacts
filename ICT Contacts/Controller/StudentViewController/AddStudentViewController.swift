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
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture()

       
    }
    
    func tapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(seletStudentImg(_ :)))
        tapGesture.numberOfTapsRequired = 1
        self.studentImg.isUserInteractionEnabled = true
        self.studentImg.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func  seletStudentImg(_ sender : UITapGestureRecognizer){
        
        
    }
    
    
    

    @IBAction func studentSaveAction(_ sender: UIButton) {
        
        
        let _ = self.studentImg.image?.jpegData(compressionQuality: 0.75)
        let pngStudentImg = self.studentImg.image?.pngData()
        
        
        
        
        let studentDic : [String : Any] = ["pngStudentImg":pngStudentImg!,"studentName":studentName! ,"studentDept":studentDept! ,"studentSession":studentSession!,"studentYear":studentYear!,"studentEmail": studentEmail! ,"studentPhone":studentPhone!]
        
       StudentDatabaseHelper.studentInstance.saveStudentData(data: studentDic)
        
        
        
    }
    
    
    
    
    
}
extension AddStudentViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    func openImage(){
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .savedPhotosAlbum
        self.present(imagePicker, animated: true, completion: nil)
        
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let img = info[.originalImage] as? UIImage {
            
            self.studentImg.image = img
            studentImg.contentMode = .scaleAspectFill
            studentImg.backgroundColor = UIColor.clear
            
            
        }
        
    }
    
    
    
}
