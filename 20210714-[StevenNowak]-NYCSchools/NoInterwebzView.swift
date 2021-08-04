//
//  NoInterwebzView.swift
//  StevenNowak-NYCSchools
//
//  Created by Steven Nowak on 8/2/21.
//

import SwiftUI

//when we get an internet connection again, you will be routed to the main view
//since we depend on the 'active' lifecycle event activating to check our connection and route you back, the only snag with the redirection here is if you come back after activating wi-fi but connection to the wi-fi network is not successful yet
//I am sure there is a better way to listen for and handle connection changes than this method (given more time and documentation)
struct NoInterwebzView: View {
    var body: some View {
        VStack {
            Text("Connection Offline").font(.title).bold().padding(.bottom)
            Text("We can't detect an active internet connection at the moment.").padding(.top)
            Text("Try turning on your cell connection or wi-fi connection and launching this program again.")
            
            
        }.navigationBarTitle(Text("Connection Offline"))
    }
    
}

struct NoInterwebzView_Previews: PreviewProvider {
    static var previews: some View {
        NoInterwebzView()
    }
}
