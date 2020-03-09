//
//  AddStudentViewController.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
   
  
    
    @IBOutlet weak var studentSaveOutlet: UIButton!
    
    @IBOutlet weak var studentImg: UIImageView!
    
    @IBOutlet weak var studentName: UITextField!
    
    @IBOutlet weak var studentDept: UITextField!
    
    @IBOutlet weak var studentSession: UITextField!
    
    @IBOutlet weak var studentYear: UITextField!
    
    @IBOutlet weak var studentEmail: UITextField!
    
    @IBOutlet weak var studentPhone: UITextField!
    
    
    let imagePicker = UIImagePickerController()
    
    var editStudentData : Student?
    
    var isUpdate : Bool = false
    var Rowindex = Int()
    
    var yearPicker : String?
    var yearList  = [String]()
    var sessionPicker : String?
    var sessionList = [String]()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture()
        yearList = ["First","Second","Third","Fourth","Fifth"]
        sessionList = ["2016-2017","2017-2018","2018-2019","2019-20120","2020-2021",]
        //self.navigationItem.hidesBackButton = true
        createPickerView()
        dismissPickerView()
        

       
    }
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if isUpdate{
            
            studentSaveOutlet.setTitle("Update", for: .normal)
        }else{
            
            studentSaveOutlet.setTitle("Save", for: .normal)
        }
        
        
         //studentImg.image = UIImage(data: (editStudentData?.img!)!)
         studentName.text = editStudentData?.name
         studentDept.text = editStudentData?.dept
         studentSession.text = editStudentData?.session
         studentYear.text = editStudentData?.year
         studentEmail.text = editStudentData?.email
         studentPhone.text = editStudentData?.phone
        
        
    }
   
   
    
    func tapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(seletStudentImg(_ :)))
        tapGesture.numberOfTapsRequired = 1
        self.studentImg.isUserInteractionEnabled = true
        self.studentImg.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func  seletStudentImg(_ sender : UITapGestureRecognizer){
        openImage()
        
    }
    
    
    

    @IBAction func studentSaveAction(_ sender: UIButton) {
        
        
        let pngStudentImg = self.studentImg.image?.jpegData(compressionQuality: 0.20)
        //let pngStudentImg = self.studentImg.image?.pngData()

        
        let studentDic : [String : Any] = ["pngStudentImg":pngStudentImg!,"studentName":studentName.text! ,"studentDept":studentDept.text! ,"studentSession":studentSession.text!,"studentYear":studentYear.text!,"studentEmail": studentEmail.text! ,"studentPhone":studentPhone.text!]
       
        
        
        
        if isUpdate{
            
            StudentDatabaseHelper.studentInstance.updateStudentData(data: studentDic, index: Rowindex)
            
            self.navigationController?.popViewController(animated: true)
          
            
            
        }else{
            

                StudentDatabaseHelper.studentInstance.saveStudentData(data: studentDic)
              
                self.navigationController?.popViewController(animated: true)
        
         
            
                
            
            
            
            
            
        }
           
            
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
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
}

extension AddStudentViewController : UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    
    
    func createPickerView(){
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        studentYear.inputView = pickerView
        studentSession.inputView = pickerView
       
        
        
        
    }
    
    func dismissPickerView(){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.action))
        toolbar.setItems([button], animated: true)
        toolbar.isUserInteractionEnabled = true
        studentYear.inputAccessoryView = toolbar
        studentSession.inputAccessoryView = toolbar
        
        
        
    }
    
    @objc func action(){
        
        studentYear.endEditing(true)
        studentSession.endEditing(true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        if studentSession.isFirstResponder{
            return sessionList.count
        }
        else if studentYear.isFirstResponder{
           return  yearList.count
        }
        return 0
       
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if studentSession.isFirstResponder{
            
            return sessionList[row]
            
        }else if studentYear.isFirstResponder{
            
            return yearList[row]
        }
        return nil
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
      //  yearPicker = yearList[row]
      //  sessionPicker = sessionList[row]
        //studentYear.text = yearPicker
       // studentSession.text = sessionPicker
        
        if studentSession.isFirstResponder{
            
            let sessionSelect  = sessionList[row]
            studentSession.text = sessionSelect
            
        }else if studentYear.isFirstResponder {
            
            let yearSeletct = yearList[row]
            studentYear.text = yearSeletct
            
        }
        
        
    }
    
    
    
    
}


