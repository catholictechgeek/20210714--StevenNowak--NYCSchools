//
//  NoInterwebzView.swift
//  StevenNowak-NYCSchools
//
//  Created by Steven Nowak on 8/2/21.
//

import SwiftUI


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
