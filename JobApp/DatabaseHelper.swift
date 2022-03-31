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
    
     
    func saveJob(object : [String:String]) {
        let job = NSEntityDescription.insertNewObject(forEntityName: "Jobs", into: context!) as! Jobs;
        
        job.title = object["title"];
        job.name = object["name"];
        job.slug = object["slug"];
        job.desc = object["desc"];
        do {
            try context?.save();
        }catch {
            print("data not saved");
        }
    }
    
    func getJobs() -> [Jobs] {
        var jobsArray = [Jobs]();
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Jobs");
        do{
            jobsArray = try context?.fetch(fetchRequest) as! [Jobs];
            
        } catch {
            print("no user");
        }
        return jobsArray;
    }
}

