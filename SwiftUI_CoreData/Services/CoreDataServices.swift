//
//  CoreDataServices.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 14/9/22.
//

import Foundation
import CoreData

class CoreDataServices : ObservableObject{

	public let container: NSPersistentContainer
	public let containerName: String = "Ob"
	public let entityName: String = "Items"


	@Published var savedEntities: [Items] = []
	@Published var savedEntitiesEmp: [Employee] = []

	init(){
		container = NSPersistentContainer(name: containerName)
		container.loadPersistentStores{ (_, error) in
			if let error = error {
				print("Error loading Core Data!  \(error)")

			}
			self.getItems()
		//	self.getEmployees()


		}

	}
	 func getItems(){
		let request = NSFetchRequest<Items>(entityName: "Items")
		do{
			savedEntities = try container.viewContext.fetch(request)
		} catch let error{
			print("Error fetching Entities!  \(error)")
		}
	}

//	func getEmployees(){
//		let requestEmp = NSFetchRequest<Employee>(entityName: entityEmp)
//		do{
//			savedEntitiesEmp = try container.viewContext.fetch(requestEmp)
//		} catch let error{
//			print("Error fetching Entities!  \(error)")
//		}
//	}


	public func update(entity: Items, name: String, type: String, descriptionItem: String){
		entity.name = name
		entity.type = type
		entity.descriptionItem = descriptionItem
		applyChanges()
	}



	 func save(){
		do{
			try container.viewContext.save()

		}catch let error{
			print("Error fetching Entities!  \(error)")
		}

	}


	 func applyChanges(){
		save()
		getItems()


	}

}
