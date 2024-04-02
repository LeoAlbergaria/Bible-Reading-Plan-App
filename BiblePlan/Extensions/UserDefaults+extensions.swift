//
//  UserDefaults+extensions.swift
//  BiblePlan
//
//  Created by Leonardo Albergaria on 01/04/24.
//

import Foundation

// Keys
private let keyReadingPlan = "keyReadingPlan"

extension UserDefaults {
    
    public func set<T: Codable>(object: T, forKey: String) throws {
        
        let jsonData = try JSONEncoder().encode(object)
        
        set(jsonData, forKey: forKey)
    }
    
    public func get<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {
        
        guard let result = value(forKey: forKey) as? Data else {
            return nil
        }
        
        return try JSONDecoder().decode(objectType, from: result)
    }
    
    // - Reading Plan
    static func setReadingPlan(_ readingPlan: ReadingPlan) {
        do {
            try UserDefaults.standard.set(object: readingPlan, forKey: keyReadingPlan)
            UserDefaults.standard.synchronize()
        } catch let error {
            print(error)
        }
    }
    
    static func getReadingPlan() -> ReadingPlan? {
        do {
              return try UserDefaults.standard.get(objectType: ReadingPlan.self, forKey: keyReadingPlan)
            } catch let error {
              print(error)
              return nil
            }
    }
}
