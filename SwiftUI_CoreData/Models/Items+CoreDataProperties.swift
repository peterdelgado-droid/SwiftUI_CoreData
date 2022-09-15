//
//  Items+CoreDataProperties.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 13/9/22.
//
//

import Foundation
import CoreData


extension Items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Items> {
        return NSFetchRequest<Items>(entityName: "Items")
    }

	@NSManaged public var type: String?
    @NSManaged public var name: String?
	@NSManaged public var descriptionItem: String?

}


