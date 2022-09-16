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

	var employee : [Employee] = []

	let itemsNow: Items
	@State private var itemName: String = ""
	let coreDM: CoreDataServices
	@Binding var needsRefresh: Bool



	@State private var name = ""
	@State private var type = ""
	@State private var descriptionItem = ""
	@State private var isAlert = false
	@State private var showingAddPrincipal : Bool = false


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
					TextField(itemsNow.name ?? "Lebensmittel", text:$name)
					TextField(itemsNow.type ?? "Lebensmittel", text: $type)
						.disableAutocorrection(true)
					TextField(itemsNow.descriptionItem ?? "Lebensmittel", text: $descriptionItem)
						.disableAutocorrection(true)

				}
				
				Section {
				Button ("Edit info") {

					if self.name == ""{
						self.name =	(itemsNow.name ?? "")
					}
					if self.type == ""{
						self.type =	(itemsNow.type ?? "")
					}
					if self.descriptionItem == ""{
						self.descriptionItem =	(itemsNow.descriptionItem ?? "")
					}

					if self.name == "" ||
						self.type == "" ||
						self.descriptionItem == "" {
						self.isAlert = true
						return
					}
//					let item = Items(context: self.moc)
//					item.name = self.name
//					item.type = self.type
//					item.descriptionItem = self.descriptionItem
					do {
						try coreDM.update(entity: itemsNow, name: self.name, type: self.type, descriptionItem: self.descriptionItem)
					} catch {
						print("whoops \(error.localizedDescription)")
					}
				}}

				List {
					ForEach(employee) { employe in
						NavigationLink  {
							//	PrincipalDetailView(principal: princ)
						} label: {
							Label("" ?? "", systemImage: "star.fill")
						}
					}
					.onDelete(perform: deletePrincipal)
					Button  {
						self.showingAddPrincipal = true
					} label: {
						Text("Add Employee")
					}
				}

				.alert(isPresented: $isAlert) { () -> Alert in
					Alert(title: Text("Alert"), message: Text("No text field should be empty"), dismissButton: .default(Text("Ok")))
				}

			}.navigationBarTitle(Text(""))
				.sheet(isPresented: $showingAddPrincipal) {
					EmployeeAddView(item: self.itemsNow)
				}
				.padding(.top, -50)
		}

	}
	func deletePrincipal( at offsets : IndexSet) {
		for offset in offsets {
			let princi = employee[offset]
			//coreDM.delete(princi)
		}
	//	dataController.save()
	}

}


						

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
