//
//  File.swift
//  SwiftUI_CoreData
//
//  Created by Peter Delgado on 15/9/22.
//

import Foundation
import SwiftUI


struct HelloCoreDataApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView(coreDM: CoreDataServices())
		}
	}
}
