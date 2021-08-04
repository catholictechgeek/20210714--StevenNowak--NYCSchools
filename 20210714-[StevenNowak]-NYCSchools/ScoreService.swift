//
//  ScoreService.swift
//  StevenNowak-NYCSchools
//
//  Created by Steven Nowak on 7/28/21.
//

import Foundation

//we are setting this up as singleton to act as pseudo-database
public class ScoreService {
    public static var instance = ScoreService()
    private var dbase:[String:SATScore]
    private static let url:String = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    private init() {
        dbase = [:];
        //to cut down on network calls and data usage (especially on cellular connection, we will do a bulk init instead of calls for idividual item and adding them to the directory as we go
        //refresh();
    }
    
    public func get(_ id:String) -> SATScore? {
        //we search by dbn here
        //we must wait until we are finished initialzing before we return results
        /*
        while (!finished) {
            sleep(1);
        }
 */
        if(has(id)) {
            return dbase[id];
        }
        else {
            //if we don't have it locally, we search the interwebz for it
            return nil;
        }
    }
    
    #if DEBUG
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
    
    internal func refresh() {
        let location = URL(string:ScoreService.url)!;
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
