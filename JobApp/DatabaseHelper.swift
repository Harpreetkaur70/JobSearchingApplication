//
//  DatabaseHelper.swift
//  JobApp
//
//

import Foundation
import  CoreData
import UIKit

class DatabaseHelper {
    
   static var shareInstance = DatabaseHelper();
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext;
    
    func save(object : [String:String]) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User;
        
        user.userName = object["userName"];
        user.password = object["password"];
        user.mobile = object["mobile"];
        do {
            try context?.save();
        }catch {
            print("data not saved");
        }
    }
    
    func getUser(userName : String, pass : String) -> Bool {
        var result : Bool = false;
        var userList = [User]();
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User");
        do{
            userList = try context?.fetch(fetchRequest) as! [User]
            
            if(userList.count>0) {
                for temp in userList {
                    if(temp.userName == userName && temp.password == pass) {
                        result =  true;
                        break;
                    } else {
                        result = false;
                    }
                }
            }
            
        } catch {
            print("no user");
        }
        return result;
    }
}

