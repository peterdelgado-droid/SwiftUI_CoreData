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
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var gender = ""
    @State private var isAlert = false
    
    private let genders = ["Male", "Female"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter first name", text: $firstName)
                        .disableAutocorrection(true)
                    TextField("Enter last name", text: $lastName)
                        .disableAutocorrection(true)
                    Picker("Select gender", selection: $gender) {
                        ForEach(genders, id: \.self) { gender in
                            Text(gender)
                        }
                    }
                }
                Button ("Add info") {
                    if self.firstName == "" ||
                        self.lastName == "" ||
                        self.gender == "" {
                        self.isAlert = true
                        return
                    }
                    let item = Items(context: self.moc)
                    item.firstName = self.firstName
                    item.lastName = self.lastName
                    item.gender = self.gender
                    do {
                        try self.moc.save()
                    } catch {
                        print("whoops \(error.localizedDescription)")
                    }
                }
                .alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Alert"), message: Text("No text field should be empty"), dismissButton: .default(Text("Ok")))
                }
            }.navigationBarTitle(Text("User Info View"))
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
