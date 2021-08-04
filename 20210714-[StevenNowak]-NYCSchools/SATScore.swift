//
//  SATScore.swift
//  StevenNowak-NYCSchools
//
//  Created by Steven Nowak on 7/26/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sATScore = try? newJSONDecoder().decode(SATScore.self, from: jsonData)

import Foundation
import UIKit

// MARK: - SATScoreElement
public struct SATScore: Codable {
    public let dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String
    public let satMathAvgScore, satWritingAvgScore: String
    
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
    
    public init(dbn: String, schoolName: String, numOfSatTestTakers: String, satCriticalReadingAvgScore: String, satMathAvgScore: String, satWritingAvgScore: String) {
        self.dbn = dbn
        self.schoolName = schoolName
        self.numOfSatTestTakers = numOfSatTestTakers
        self.satCriticalReadingAvgScore = satCriticalReadingAvgScore
        self.satMathAvgScore = satMathAvgScore
        self.satWritingAvgScore = satWritingAvgScore
    }
    
}
