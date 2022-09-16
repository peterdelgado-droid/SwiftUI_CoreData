//
//  Equipment+CoreDataProperties.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 16/9/22.
//
//

import Foundation
import CoreData


extension Equipment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Equipment> {
        return NSFetchRequest<Equipment>(entityName: "Equipment")
    }

    @NSManaged public var nameE: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Equipment {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Items)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Items)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Equipment : Identifiable {

}
