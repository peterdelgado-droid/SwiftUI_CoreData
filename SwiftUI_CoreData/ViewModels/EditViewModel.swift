//
//  EditViewModel.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 14/9/22.
//

import Foundation
import CoreData



class EditViewModel : ObservableObject {

	let container: NSPersistentContainer
	@Published var data: [Items] = []

	init() {
		container = NSPersistentContainer(name:"Objects")
		container.loadPersistentStores {( description, error) in
			if let error = error {
				print("ERROR LOADING DATA: \(error)")
			} else {
				print("Sucessfully loaded Core Data")
			}
		}
		fetchItem()
	}

	func fetchItem() {
		let request = NSFetchRequest<Items>(entityName: "Items")

		do {
			self.data = try container.viewContext.fetch(request)
		} catch let error {
			print("Error fetching. \(error)")
		}
	}

	func addFood(name:String, amountUnit:String, amount:Int16) {
		let newItem = Items(context:container.viewContext)
//		newItem.name = name
//		newItem.type = type
//		newItem.descriptionItem = amount
		saveData()
	}

	func saveData() {
		do {
			try container.viewContext.save()
			fetchItem()
		} catch let error {
			print("Error saving... \(error)")
		}
	}
}
