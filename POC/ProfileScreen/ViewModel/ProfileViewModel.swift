//
//  ViewModel.swift
//  POC
//
//  Created by Shivani Pandey on 20/08/25.
//

import SwiftUI


class ProfileViewModel {
    
  @Published var profiles: [ProfileData] = []
    
    init() {
        loadProfiles()
    }
    
    func loadProfiles() {
        profiles = JSONLoader.loadProfiles()
    }
}
