//
//  ContentView.swift
//  20210714-[StevenNowak]-NYCSchools
//
//  Created by Steven Nowak on 7/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var items: [School]
    
    init(_ itemz:[School] = []) {
        items = itemz
    }
    
    var body: some View {
        NavigationView {
            List {
                    ForEach(items) { item in
                        NavigationLink(destination: SATView(item)) {
                            VStack {
                                Text(item.schoolName ?? "").bold()
                                Text(item.neighborhood ?? "")
                                Text(item.borough ?? "")
                            }
                        }
                    }
            }.navigationBarTitle(Text("NYC Schools")).onAppear {
                if(items.count == 0) {
                    do {
                        items = try School.getSchools()
                    }
                    catch {
                        //do nothing
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView([School(nomine: "fowaeijf"),School(nomine: "aewfjawefow")])
        }
    }
}
