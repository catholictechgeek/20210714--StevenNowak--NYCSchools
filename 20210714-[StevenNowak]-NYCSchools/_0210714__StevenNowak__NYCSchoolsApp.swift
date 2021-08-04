//
//  _0210714__StevenNowak__NYCSchoolsApp.swift
//  20210714-[StevenNowak]-NYCSchools
//
//  Created by Steven Nowak on 7/14/21.
//

import SwiftUI

@main
struct _0210714__StevenNowak__NYCSchoolsApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            //we check for a connction to the interwebz and if we don't have it, I route you to the connection error page where you will stay within the program until you regain your internet connection (and yes, if you lose your internet connection on the details page, your state will be saved and restored when your internet connection is)
            //we are using the Reach class to detect a connection (found at https://github.com/Isuru-Nanayakkara/Reach)
            switch Reach().connectionStatus() {
            case .unknown, .offline:
                NoInterwebzView()
            case .online(.wwan), .online(.wiFi):
                ContentView().onAppear {
                    if(ScoreService.instance.count() == 0) {
                        ScoreService.instance.refresh()
                    }
                }
            
            }
        }
    }
}
