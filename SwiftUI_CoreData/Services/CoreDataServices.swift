//
//  CoreDataServices.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 14/9/22.
//

import Foundation
import CoreData

class CoreDataServices{

	private let container: NSPersistentContainer
	private let containerName: String = "Objects"
	private let entityName: String = "Items"

	@Published var savedEntities: [Items] = []

	init(){
		container = NSPersistantContainer(name: containerName)

	}


}
