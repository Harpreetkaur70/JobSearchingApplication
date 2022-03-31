//
//  Jobs+CoreDataProperties.swift
//  
//
//

import Foundation
import CoreData


extension Jobs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Jobs> {
        return NSFetchRequest<Jobs>(entityName: "Jobs")
    }

    @NSManaged public var title: String?
    @NSManaged public var name: String?
    @NSManaged public var slug: String?
    @NSManaged public var desc: String?

}
