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

    static let studentInstance = StudentDatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
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
    
    
    
    
}
