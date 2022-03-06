//
//  DataMO+CoreDataProperties.swift
//  To do
//
//  Created by Vu Thanh on 05/03/2022.
//
//

import Foundation
import CoreData


extension DataMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DataMO> {
        return NSFetchRequest<DataMO>(entityName: "Data")
    }

    @NSManaged public var main: NSSet?
    @NSManaged public var sub: NSSet?

}

// MARK: Generated accessors for main
extension DataMO {

    @objc(addMainObject:)
    @NSManaged public func addToMain(_ value: ListMO)

    @objc(removeMainObject:)
    @NSManaged public func removeFromMain(_ value: ListMO)

    @objc(addMain:)
    @NSManaged public func addToMain(_ values: NSSet)

    @objc(removeMain:)
    @NSManaged public func removeFromMain(_ values: NSSet)

}

// MARK: Generated accessors for sub
extension DataMO {

    @objc(addSubObject:)
    @NSManaged public func addToSub(_ value: ListMO)

    @objc(removeSubObject:)
    @NSManaged public func removeFromSub(_ value: ListMO)

    @objc(addSub:)
    @NSManaged public func addToSub(_ values: NSSet)

    @objc(removeSub:)
    @NSManaged public func removeFromSub(_ values: NSSet)
    

}

extension DataMO : Identifiable {

}
