//
//  EditView.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 14/9/22.
//

import SwiftUI

struct EditView: View {
	@Environment(\.managedObjectContext) var moc
	@Environment(\.presentationMode) var presentationMode

	//@StateObject var items: Items

//let viewModel: EditViewModel

	let items: Items
	@State private var itemName: String = ""
	let coreDM: CoreDataServices
	@Binding var needsRefresh: Bool



	@State private var name = ""
	@State private var type = ""
	@State private var descriptionItem = ""
	@State private var isAlert = false


//	init(items:Items, viewModel:EditViewModel) {
//		self._items = StateObject(wrappedValue:items)
//	//	self.viewModel = viewModel
//		self._name = State(initialValue:items.name ?? "g")
//		self._type = State(initialValue: items.type ?? "g")
//		self._descriptionItem = State(initialValue: items.descriptionItem ?? "")
//	}


	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField(items.name ?? "Lebensmittel", text:$name)
					TextField("Enter type", text: $type)
						.disableAutocorrection(true)
					TextField("Enter Description", text: $descriptionItem)
						.disableAutocorrection(true)

				}
				Button ("Add info") {
					if self.name == "" ||
						self.type == "" ||
						self.descriptionItem == "" {
						self.isAlert = true
						return
					}
					let item = Items(context: self.moc)
					item.name = self.name
					item.type = self.type
					item.descriptionItem = self.descriptionItem
					do {
						try self.moc.save()
					} catch {
						print("whoops \(error.localizedDescription)")
					}
				}
//				.alert(isPresented: $isAlert) { () -> Alert in
//					Alert(title: Text("Alert"), message: Text("No text field should be empty"), dismissButton: .default(Text("Ok")))
				//}
			}.navigationBarTitle(Text("Item"))
		}
	}
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
