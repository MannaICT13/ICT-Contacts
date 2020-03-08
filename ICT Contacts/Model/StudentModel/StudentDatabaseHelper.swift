//
//  StudentDatabaseHelper.swift
//  ICT Contacts
//
//  Created by Md Khaled Hasan Manna on 5/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class StudentDatabaseHelper: NSObject {
    
    
    //create a singleton model

    static let studentInstance = StudentDatabaseHelper()
    
    //create a context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    //save data to core data
    
    func saveStudentData(data : [String : Any]){
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        student.img  = data["pngStudentImg"] as? Data
        student.name = data["studentName"] as? String
        student.dept = data["studentDept"] as? String
        student.session = data["studentSession"] as? String
        student.year = data["studentYear"] as? String
        student.email = data["studentEmail"] as? String
        student.phone = data["studentPhone"] as? String
        
        do{
            
            try context.save()
            
        }catch{
            
            print("Student Data Save Error",error.localizedDescription)
            
            
            
        }
        
        
        
    }
    
    
    //get data from core data
    
    
    func getStudentData() -> [Student]{
        
        
        var student = [Student]()
        
         let studentData = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        do{
            
            try student = context.fetch(studentData) as! [Student]
        }catch{
            
            print("Error getting data ",error.localizedDescription)
        }
        
        
        return student
        
    }
    
    
    //delete data from core data 
    
    func deleteStudentData(index : Int){
        
        var student = getStudentData()
        
         let deleteObject = student.remove(at: index) as NSManagedObject
        
         context.delete(deleteObject)
        
        do{
            try context.save()
             
            
        }catch{
            
            
            print("Error deleting data",error.localizedDescription)
            
        }
        
        
        
        
    }
    
    
    //update student data
    
    
    
    func updateStudentData(data : [String : Any],index : Int){
        
        let student = getStudentData()
        
        student[index].img = data["pngStudentImg"] as? Data
        student[index].name = data["studentName"] as? String
        student[index].dept = data["studentDept"] as? String
        student[index].session = data["studentSession"] as? String
        student[index].year = data["studentYear"] as? String
        student[index].email = data["studentEmail"] as? String
        student[index].phone = data["studentPhone"] as? String
        
        do{
            try context.save()
        }catch{
            
            print("Error in update ",error.localizedDescription)
        }
        
        
        
        
        
    }
    
    
    
    
    
}
