//
//  ScoreService.swift
//  StevenNowak-NYCSchools
//
//  Created by Steven Nowak on 7/28/21.
//

import Foundation

//we are setting this up as singleton to act as pseudo-database and as such, we only want 1 instance of this ever
//we are using a Dictionary as storage because of its ease in getting up and running and its fetch speed (since we only add once and then just fetch on primary key)
public class ScoreService {
    public static var instance = ScoreService()
    private var dbase:[String:SATScore]
    private static let url:String = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    private init() {
        dbase = [:];
    }
    
    public func get(_ id:String) -> SATScore? {
        //we search by dbn here
        if(has(id)) {
            return dbase[id];
        }
        else {
            //if we don't have it locally, we search the interwebz for it
            return nil;
        }
    }
    
    #if DEBUG
    //this function is for SwiftUI previews only (to add dummy item to our score database)
    internal func add(_ item:SATScore) {
        if(!has(item.dbn)) {
            dbase[item.dbn] = item;
        }
    }
    #endif
    
    public func has(_ id:String) -> Bool {
        return dbase.keys.contains(id);
    }
    
    public func count() -> Int {
        return dbase.count;
    }
    
    //this function refreshes the SAT score data with new json data
    internal func refresh() {
        let location = URL(string:ScoreService.url)!;
        //again, async/await support would be very helpful here, but we won't get that wonderful functionality until Swift 5.5 finally arrives
        let tsk:URLSessionTask = URLSession.shared.dataTask(with: location) { (data, resp, exception) in
            guard let bits = data else {
                return;
            }
            let decoder = JSONDecoder();
            #if DEBUG
            //this is purely to see what the json data looks like for debugging
            let outputtest = String(data:bits, encoding: .utf8);
            #endif
            guard let decoded = try? decoder.decode([SATScore].self, from: bits)
            else {
                return;
            }
            for item in decoded {
                self.dbase[item.dbn] = item;
            }
        };
        tsk.resume();
    }
}
