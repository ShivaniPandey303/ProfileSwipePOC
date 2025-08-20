//
//  JSONLoader.swift
//  POC
//
//  Created by Shivani Pandey on 20/08/25.
//

import Foundation

class JSONLoader {
    
    static func loadProfiles() -> [ProfileData] {
    
        guard let url = Bundle.main.url(forResource: "profiles", withExtension: "json") else {
            print("JSON not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let profiles = try decoder.decode([ProfileData].self, from: data)
            return profiles
        } catch {
            print("Error loading JSON: \(error)")
            return []
        }
    }
}
