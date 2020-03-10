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
    
    

    var designation : String?
    
    var designationList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         designationList = ["Lecturer","Assistant Professor","Associate Professo","Professor"]
         createPickerView()
         dismissPickerView()
        
    }
    
    @IBAction func teacherSaveBtnAction(_ sender: Any) {
        
        
        let teacherJpgImg = teacherImg.image?.jpegData(compressionQuality: 0.20)
        let _ = teacherImg.image?.pngData()
        
        
        
        let teacherDic : [String : Any] = ["teacherImg":teacherJpgImg! ,"teacherName":teacherName.text!,"teacherDesignation":teacherDesignation.text!,"teacherEmail":teacherEmail.text!,"teacherPhone":teacherPhone.text!]
       
       TeacherDatabaseHelper.teacherInstance.saveTeacherData(obj: teacherDic)
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    

}
extension AddTeacherViewController : UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    
    
    func createPickerView(){
        
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        teacherDesignation.inputView = pickerView
        
        
        
    }
    func dismissPickerView(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(action))
        toolBar.setItems([button], animated: true)
        teacherDesignation.isUserInteractionEnabled = true
        teacherDesignation.inputAccessoryView =  toolBar
        
        
    }
    @objc func action(){
        
        teacherDesignation.endEditing(true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return designationList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return designationList[row]
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if teacherDesignation.isFirstResponder{
            
            let selectDesignation = designationList[row]
            designation = selectDesignation
            teacherDesignation.text = designation
            
            
        }
        
    }
    
    
    
}
