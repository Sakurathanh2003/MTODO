//
//  SubTaskMO+CoreDataProperties.swift
//  To do
//
//  Created by Vu Thanh on 05/03/2022.
//
//

import Foundation
import CoreData


extension SubTaskMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubTaskMO> {
        return NSFetchRequest<SubTaskMO>(entityName: "SubTask")
    }

    @NSManaged public var nameSubList: String?
    @NSManaged public var task: TaskMO?
    
    static func insertNewSubTask(nameSubList: String) -> SubTaskMO?{
        let subTask = NSEntityDescription.insertNewObject(forEntityName: "Task", into: AppDelegate.managedObjectContext!) as! SubTaskMO
        
        subTask.nameSubList = nameSubList
        
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            let nserror = error as NSError
            print("Cannot insert new task. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
        print("Insert task with name: \(subTask.nameSubList ?? "") successful")
        return subTask
    }
    
    static func getAllSubTask() -> [SubTaskMO]{
        var result = [SubTaskMO]()
        let moc = AppDelegate.managedObjectContext
        
        do {
            result = try moc!.fetch(SubTaskMO.fetchRequest()) as! [SubTaskMO]
        } catch {
            print("Cannot fetch SubTask. Error is: \(error)")
            return result
        }
        
        return result
    }
    
    static func removeAllSubTask() -> Bool{
        let moc = AppDelegate.managedObjectContext
        let subTasks = SubTaskMO.getAllSubTask()
        for subTask in subTasks {
            moc?.delete(subTask)
        }
        
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            let nserror = error as NSError
            print("Delete all SubTasks unsuccessful. Error is: \(nserror), \(nserror.userInfo)")
            return false
        }
        print("Delete all SubTasks successful")
        return true
    }
    
    static func getSubTaskWithFilter(nameTask: String) -> [SubTaskMO]{
        let moc = AppDelegate.managedObjectContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = SubTaskMO.fetchRequest()
        var result = [SubTaskMO]()
        var subPredicates = [NSPredicate]()
        
        var predicate = NSPredicate(format: "task == %@", nameTask)
        subPredicates.append(predicate)
        
        do {
            result = try moc!.fetch(fetchRequest) as! [SubTaskMO]
        } catch {
            print("Cannot fetch subtask. Error: \(error) ")
            return result
        }
        
        return result
    }

}

extension SubTaskMO : Identifiable {

}
