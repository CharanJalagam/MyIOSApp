//
//  UsersData.swift
//  Demo
//
//  Created by user259867 on 5/8/24.
//

import Foundation
import UIKit
import CoreData
class UsersData{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createUser(user: UsersProfile){
        guard let entity = NSEntityDescription.entity(forEntityName: "Users", in: context) else {
            fatalError("Failed to find entity description")
        }
        let data = NSManagedObject(entity: entity, insertInto: context)
        data.setValue(user.name, forKey: "name")
        data.setValue(user.email, forKey: "email")
        data.setValue(user.password, forKey: "password")
        data.setValue(user.gender, forKey: "gender")
        data.setValue(user.age, forKey: "age")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getUserByEmail(email: String) -> UsersProfile? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let result = try context.fetch(fetchRequest)
            if let userData = result.first as? NSManagedObject {
                let name = userData.value(forKey: "name") as? String ?? ""
                let email = userData.value(forKey: "email") as? String ?? ""
                let password = userData.value(forKey: "password") as? String ?? ""
                let gender = userData.value(forKey: "gender") as? String ?? ""
                let age = userData.value(forKey: "age") as? String ?? ""
                let userProfile = UsersProfile(name: name, email: email, password: password, gender: gender, age: age)
                return userProfile
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return nil
    }

}
    
