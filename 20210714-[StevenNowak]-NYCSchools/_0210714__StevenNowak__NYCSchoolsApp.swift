//
//  _0210714__StevenNowak__NYCSchoolsApp.swift
//  20210714-[StevenNowak]-NYCSchools
//
//  Created by Steven Nowak on 7/14/21.
//

import SwiftUI

@main
struct _0210714__StevenNowak__NYCSchoolsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
