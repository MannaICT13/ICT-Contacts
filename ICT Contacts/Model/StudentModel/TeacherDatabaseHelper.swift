//
//  TeacherDatabaseHelper.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 10/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

import CoreData

class TeacherDatabaseHelper: NSObject {
    
    
    
    static let teacherInstance = TeacherDatabaseHelper()
    
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
   func saveTeacherData(obj : [String : Any]){
        
        let teacher = NSEntityDescription.insertNewObject(forEntityName: "Teacher", into: context) as! Teacher
        
        teacher.img =  obj["teacherImg"] as? Data
        teacher.name = obj["teacherName"] as? String
        teacher.designation = obj["teacherDesignation"] as? String
        teacher.email = obj["teacherEmail"] as? String
        teacher.phone = obj["teacherPhone"] as? String
        
        do{
            try context.save()
            
        }catch{
            
            print("Error in Teacher save data",error.localizedDescription)
            
        }
   
        
        
    }
    
    func retriveTeacherData() -> [Teacher]{
    
        var teacher = [Teacher]()
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Teacher")
        
        do{
            teacher = try context.fetch(fetch) as! [Teacher]
        }catch{
            
            print("Error in retrive teacher data",error.localizedDescription)
        }
        
    
    
    
    
        return teacher
    }
    
    
    
    

}
