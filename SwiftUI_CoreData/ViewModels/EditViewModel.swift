//
//  EditViewModel.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 14/9/22.
//

import Foundation
import CoreData
import Combine


//.map { (Items) -> [Items]  in
//return Items
//}
class EditViewModel : ObservableObject {

	
	private let containerName: String = "Objects"
	private let entityName: String = "Items"
	let container: NSPersistentContainer
	@Published var data: [Items] = []

	//get actual items
	private let coreDataService = CoreDataServices()
	private var cancellable = Set<AnyCancellable>()

	
	init() {
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
			data = try container.viewContext.fetch(request)
		} catch let error{
			print("Error fetching Entities!  \(error)")
		}
	}
	func addSubscribers(){
		coreDataService.$savedEntities

			.sink { (returnedItems) in
				self.data = returnedItems
			}
			.store(in: &cancellable)
}

	func updateEntity(entity: Items, name: String, type: String, descriptionItem: String){
		coreDataService.update(entity: entity, name: name, type: type, descriptionItem: type)
	}


}
