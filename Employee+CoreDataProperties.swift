//
//  Employee+CoreDataProperties.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 16/9/22.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var nameEmp: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Employee {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Items)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Items)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Employee : Identifiable {

}
