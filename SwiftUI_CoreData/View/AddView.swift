//
//  SwiftUI_CoreDataApp.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 13/9/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var type = ""
    @State private var descriptionItem = ""
    @State private var isAlert = false
    

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter name of item", text: $name)
                        .disableAutocorrection(true)
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
                .alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Alert"), message: Text("No text field should be empty"), dismissButton: .default(Text("Ok")))
                }
            }.navigationBarTitle(Text("Item"))
        }
    }
}

#if DEBUG
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
#endif
