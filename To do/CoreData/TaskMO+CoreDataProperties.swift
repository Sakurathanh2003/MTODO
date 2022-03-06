//
//  TaskMO+CoreDataProperties.swift
//  To do
//
//  Created by Vu Thanh on 05/03/2022.
//
//

import Foundation
import CoreData


extension TaskMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskMO> {
        return NSFetchRequest<TaskMO>(entityName: "Task")
    }

    @NSManaged public var finish: Bool
    @NSManaged public var important: Bool
    @NSManaged public var nameList: String?
    @NSManaged public var nameTask: String?
    @NSManaged public var subTasks: NSSet?
    @NSManaged public var list: ListMO?

}

// MARK: Generated accessors for subTasks
extension TaskMO {

    @objc(addSubTasksObject:)
    @NSManaged public func addToSubTasks(_ value: SubTaskMO)

    @objc(removeSubTasksObject:)
    @NSManaged public func removeFromSubTasks(_ value: SubTaskMO)

    @objc(addSubTasks:)
    @NSManaged public func addToSubTasks(_ values: NSSet)

    @objc(removeSubTasks:)
    @NSManaged public func removeFromSubTasks(_ values: NSSet)
    
    static func insertNewTask(finish: Bool, important: Bool, nameList: String, nameTask: String) -> TaskMO?{
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: AppDelegate.managedObjectContext!) as! TaskMO
        
        task.finish = finish
        task.important = important
        task.nameList = nameList
        task.nameTask = nameTask
        
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            let nserror = error as NSError
            print("Cannot insert new task. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
        print("Insert task with name: \(task.nameTask ?? "") successful")
        return task
    }
    
    static func fetchTaskImportant() -> [TaskMO]{
        let moc = AppDelegate.managedObjectContext
        
        let fetchRequest: NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
        var result = [TaskMO]()
        var subPredicates = [NSPredicate]()
        
        let predicate = NSPredicate(format: "important == true")
        subPredicates.append(predicate)
        
        do {
            result = try moc!.fetch(fetchRequest) as! [TaskMO]
        } catch {
            print("Cannot fetch task. Error: \(error)")
            return result
        }
        
        return result
    }
    
    static func fetchTaskWithFilter(nameList: String) -> [TaskMO]{
        let moc = AppDelegate.managedObjectContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = TaskMO.fetchRequest()
        var result = [TaskMO]()
        var subPredicates = [NSPredicate]()
        
        var predicate = NSPredicate(format: "nameList == %@", nameList)
        subPredicates.append(predicate)
        
        do {
            result = try moc!.fetch(fetchRequest) as! [TaskMO]
        } catch {
            print("Cannot fetch subtask. Error: \(error) ")
            return result
        }
        
        return result
    }
    
    

}

extension TaskMO : Identifiable {

}
