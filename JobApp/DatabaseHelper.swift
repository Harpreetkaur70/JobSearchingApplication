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
    
    
}

