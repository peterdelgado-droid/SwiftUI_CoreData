//
//  EditViewModel.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 14/9/22.
//

import Foundation
import CoreData
import Combine



class EditViewModel : ObservableObject {

	
//	public let containerName: String = "SwiftUI-CoreData-Info"
//	public let entityName: String = "Items"
//	let container: NSPersistentContainer
//	@Published var data: [Items] = []
//
//	//get actual items
//	public let coreDataService = CoreDataServices()
//	public var cancellable = Set<AnyCancellable>()
//
//	
//	init() {
//		container = NSPersistentContainer(name: containerName)
//		container.loadPersistentStores{ (_, error) in
//			if let error = error {
//				print("Error loading Core Data!  \(error)")
//
//			}
//			self.getItems()
//
//
//		}
//	}
//	
//	public func getItems(){
//		let request = NSFetchRequest<Items>(entityName: entityName)
//		do{
//			data = try container.viewContext.fetch(request)
//		} catch let error{
//			print("Error fetching Entities!  \(error)")
//		}
//	}
//	func addSubscribers(){
//		coreDataService.$savedEntities
//
//			.sink { (returnedItems) in
//				self.data = returnedItems
//			}
//			.store(in: &cancellable)
//}
//
//	func updateEntity(entity: Items, name: String, type: String, descriptionItem: String){
//		coreDataService.update(entity: entity, name: name, type: type, descriptionItem: type)
//	}


}
