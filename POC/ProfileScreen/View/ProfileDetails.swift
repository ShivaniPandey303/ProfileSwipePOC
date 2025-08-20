//
//  ProfileDetails.swift
//  POC
//
//  Created by Shivani Pandey on 19/08/25.
//

import SwiftUI

struct ProfileDetails: View {
    
    @State var profile: ProfileData
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(profile.name)")
                    .font(.headline)
                    .foregroundStyle(.black)
                Text("\(profile.age)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("\(profile.location)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
            }
        }
        .navigationTitle("Profile Details")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all)
    }
}
