//
//  ListMO+CoreDataProperties.swift
//  To do
//
//  Created by Vu Thanh on 05/03/2022.
//
//

import Foundation
import CoreData


extension ListMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListMO> {
        return NSFetchRequest<ListMO>(entityName: "List")
    }

    @NSManaged public var color: String?
    @NSManaged public var icon: String?
    @NSManaged public var nameList: String?
    @NSManaged public var listTask: NSSet?
    @NSManaged public var maindata: DataMO?
    @NSManaged public var subdata: DataMO?

}

// MARK: Generated accessors for listTask
extension ListMO {

    @objc(addListTaskObject:)
    @NSManaged public func addToListTask(_ value: TaskMO)

    @objc(removeListTaskObject:)
    @NSManaged public func removeFromListTask(_ value: TaskMO)

    @objc(addListTask:)
    @NSManaged public func addToListTask(_ values: NSSet)

    @objc(removeListTask:)
    @NSManaged public func removeFromListTask(_ values: NSSet)
    
    static func insertNewList(color: String, icon: String, nameList: String) -> ListMO?{
        let list = NSEntityDescription.insertNewObject(forEntityName: "Task", into: AppDelegate.managedObjectContext!) as! ListMO
        
        list.color = color
        list.icon = icon
        list.nameList = nameList
        
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            let nserror = error as NSError
            print("Cannot insert new task. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
        print("Insert task with name: \(list.nameList ?? "") successful")
        return list
    }

}

extension ListMO : Identifiable {

}
