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
		container = NSPersistentContainer(name: containerName)
		container.loadPersistentStores{ (_, error) in
			if let error = error {
				print("Error loading Core Data!  \(error)")

			}
			self.getItems()


		}

	}
	private func getItems(){
		let request = NSFetchRequest<Items>(entityName: entityName)
		do{
			savedEntities = try container.viewContext.fetch(request)
		} catch let error{
			print("Error fetching Entities!  \(error)")
		}
	}


	public func update(entity: Items, name: String, type: String, descriptionItem: String){
		entity.name = name
		entity.type = type
		entity.descriptionItem = descriptionItem
		applyChanges()
	}



	private func save(){
		do{
			try container.viewContext.save()

		}catch let error{
			print("Error fetching Entities!  \(error)")
		}

	}


	private func applyChanges(){
		save()
		getItems()


	}

}
