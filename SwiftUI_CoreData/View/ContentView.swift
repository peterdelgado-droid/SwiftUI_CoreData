//
//  ContentView.swift
//  CoreDataSwitfUI
//
//  Created by Peter Delgado on 13/9/22.
//


import SwiftUI

struct ContentView: View {

	let coreDM: CoreDataServices
	@State private var itemsPlus: [Items] = [Items]()
	@State private var needsRefresh: Bool = true



//	let viewModel: EditViewModel
//	@StateObject var itemsSecond: Items

	@State private var query = ""
    @Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Items.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Items.name, ascending: true)]) var items: FetchedResults<Items>
    @State private var showingAddUser = false
    
    var body: some View {
        NavigationView {
            List {
				
                ForEach(items, id: \.self) { item in
					NavigationLink(destination:  EditView(itemsNow: item, coreDM: coreDM, needsRefresh: $needsRefresh).environment(\.managedObjectContext, self.moc))


					{
                        VStack(alignment: .leading) {
							HStack{
								Text("Name:")
							Text(item.name ?? "")
							}

							HStack{
							Text("Type:")
							Text(item.type ?? "")
								}

							HStack{
								
								Text(item.descriptionItem ?? "")

							}}
                        Spacer()
                    }
                }
                .onDelete(perform: deleteUser(at:))
                .edgesIgnoringSafeArea(.all)
                if items.count == 0 {
                    Text("No user found")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Items")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button("Add") {
                                    self.showingAddUser.toggle()
            })
                .sheet(isPresented: $showingAddUser) {
                    AddView().environment(\.managedObjectContext,
                                          self.moc)
            }
        }
		.searchable(text: $query,
					placement: .navigationBarDrawer(displayMode: .always))
		.onChange(of: query) { newValue in
			items.nsPredicate = searchPredicate(query: newValue)
    }
	}

		private func searchPredicate(query: String) -> NSPredicate? {
			if query.isEmpty { return nil }
			return NSPredicate(format: "%K BEGINSWITH[cd] %@",
							   #keyPath(Items.name), query)
		}
    
    func deleteUser(at offsets: IndexSet) {
        for index in offsets {
            let items = items[index]
            moc.delete(items)
        }
        try? moc.save()
    }
}

#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
#endif
