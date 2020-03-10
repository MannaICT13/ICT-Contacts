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
    
    func daleteTeacherData(index : Int){
        
        
        var teacher = retriveTeacherData()
        
        let deleteObj = teacher.remove(at: index) as NSManagedObject
        
        context.delete(deleteObj)
        
        
        do{
            try context.save()
        }catch{
            
            print("Faild to delete data From Teacher database",error.localizedDescription)
            
        }
        
        
        
        
        
    }
    
    func updateTeacherData(data : [String:Any],index : Int){
        
        let teacher = retriveTeacherData()
        
        teacher[index].img = data["teacherImg"] as? Data
        teacher[index].name = data["teacherName"] as? String
        teacher[index].designation = data["teacherDesignation"] as? String
        teacher[index].email = data["teacherEmail"] as? String
        teacher[index].phone = data["teacherPhone"] as? String
        
        do{
            try context.save()
        }catch{
            
            print("Error in update teacher data",error.localizedDescription)
        }
        
        
        
        
    }
    
    
    
    
    

}
