////
////  EmployeeAddView.swift
////  SwiftUI_CoreData
////
////  Created by Peter Delgado on 16/9/22.
////
//

import Foundation
import SwiftUI
enum ActiveAlertPrincipal {
	case first, second, third, zero
}

struct EmployeeAddView: View {

	@Environment(\.presentationMode) var presentationMode
	@Environment(\.managedObjectContext) var moc
    @EnvironmentObject var dataController : CoreDataServices

	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	let item : Items

	@State private var showAlert : Bool = false
	@State private var activeAlert : ActiveAlertPrincipal = .zero

	@State private var name = ""
	@State private var age = ""
	@State private var experience = ""

	var body: some View {
		NavigationView {
			Form {
				Section (header: Text("Name")) {
					TextField("Enter a name", text: $name)
				}
				Section (header: Text("Title")) {
					TextField("Enter title", text: $age)
				}
				Section (header: Text("Department")) {
					TextField("Enter experience", text: $experience)
				}
			}
			.navigationTitle("Add New Employee")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button {
						self.presentationMode.wrappedValue.dismiss()
					} label: {
						Text("Dismiss")
					}
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						saveButton()
					} label: {
						Text("Save")
					}
				}
			}
			.alert(isPresented : $showAlert) {
				switch activeAlert {
				case .first:
					return Alert(title: Text("Name is empty"), message: Text("Please enter name"), dismissButton: .default(Text("OK")))
				case .second:
					return Alert(title: Text("Age is incorrect"), message: Text("Please enter an integer"), dismissButton: .default(Text("OK")))
				case .third:
					return Alert(title: Text("Experience is incorrect"), message: Text("Please enter an integer"), dismissButton: .default(Text("OK")))

				case .zero:
					return Alert(title: Text("Name is empty"), message: Text("Please enter name"), dismissButton: .cancel())
				}
			}
		}
	}

	func saveButton() {

		//Validation for textfields
		if self.name == "" {
			self.activeAlert = .first
			self.showAlert = true
		}
		else if Int(self.age) == nil || self.age == "" {
			self.activeAlert = .second
			self.showAlert = true
		}
		else if Int(self.experience) == nil || self.experience == ""  {
			self.activeAlert = .third
			self.showAlert = true
		}

		else {
			let employee = Employee(context: context)


			employee.nameEmp = self.name
			

			do {
				
				try self.context.save()



			} catch {
				print("Unable to Save Request, \(error)")
			}


			presentationMode.wrappedValue.dismiss()
		}
	}
}

//struct AddPrincipalView_Previews: PreviewProvider {
//	static let dataController = DataController.preview
//
//	static var previews: some View {
//		let school = School(context: dataController.container.viewContext)
//		return AddNewPrincipalView(school: school).environment(\.managedObjectContext, dataController.container.viewContext).environmentObject(dataController)
//	}

