//
//  ProfileScreen.swift
//  POC
//
//  Created by Shivani Pandey on 19/08/25.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State private var profiles: [ProfileData] = JSONLoader.loadProfiles()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if profiles.isEmpty {
                    VStack(spacing: 16) {
                        Text("No more profiles 👀")
                            .font(.title2).foregroundColor(.gray)
                        
                        Button("Reload Profiles") {
                            reloadProfiles()
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                } else {
                    ForEach(profiles) { profile in
                        ProfileCardView(profile: profile){ removedProfile, liked in
                            removeProfile(removedProfile, liked: liked)
                        }
                    }
                }
            }
        }
        .navigationTitle("Profiles")
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
    
    private func removeProfile(_ profile: ProfileData, liked: Bool) {
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
               profiles.removeAll { $0.id == profile.id }
               if profiles.isEmpty {
                   reloadProfiles()
               }
               print(liked ? "Liked \(profile.name)" : "Disliked \(profile.name)")
           }
       }
    
    private func reloadProfiles() {
       profiles.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            profiles = JSONLoader.loadProfiles()
        }
    }
}

#Preview {
    ProfileScreen()
}
