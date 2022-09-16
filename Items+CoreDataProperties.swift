//
//  Items+CoreDataProperties.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 16/9/22.
//
//

import Foundation
import CoreData


extension Items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Items> {
        return NSFetchRequest<Items>(entityName: "Items")
    }

    @NSManaged public var descriptionItem: String?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var employee: Employee?
    @NSManaged public var equipment: NSSet?

}

// MARK: Generated accessors for equipment
extension Items {

    @objc(addEquipmentObject:)
    @NSManaged public func addToEquipment(_ value: Equipment)

    @objc(removeEquipmentObject:)
    @NSManaged public func removeFromEquipment(_ value: Equipment)

    @objc(addEquipment:)
    @NSManaged public func addToEquipment(_ values: NSSet)

    @objc(removeEquipment:)
    @NSManaged public func removeFromEquipment(_ values: NSSet)

}

extension Items : Identifiable {

}
