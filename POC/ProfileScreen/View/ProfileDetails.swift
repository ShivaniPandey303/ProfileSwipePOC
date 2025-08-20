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
            VStack(spacing: 10) {
                AsyncImage(url: URL(string: profile.imageURL)) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(height: 300)
                .clipped()
                .cornerRadius(16)
                
                HStack {
                    Text("\(profile.name)")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    Text("(\(profile.age))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
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
