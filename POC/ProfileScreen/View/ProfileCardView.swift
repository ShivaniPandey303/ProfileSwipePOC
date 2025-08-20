//
//  ProfileCardView.swift
//  POC
//
//  Created by Shivani Pandey on 19/08/25.
//

import SwiftUI

struct ProfileCardView: View {
    let profile: ProfileData
    @State private var offset: CGSize = .zero
    var onRemove: (_ profile: ProfileData, _ liked: Bool) -> Void
    
    var body: some View {
        ZStack {
            VStack {
                profileImageView
                nameView
            }
            .padding()
        }
        .offset(x: offset.width, y: 0)
        .rotationEffect(.degrees(Double(offset.width/20)))
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.offset = value.translation
                }
                .onEnded { _ in
                    let threshold: CGFloat = 120
                    if offset.width > threshold {
                        print("Liked \(self.profile.name)")
                        withAnimation {
                            offset = CGSize(width: 1000, height: 0)
                        }
                        onRemove(profile, true)
                    } else if offset.width < -threshold {
                        print("Disliked \(self.profile.name)")
                        withAnimation {
                            offset = CGSize(width: -1000, height: 0)
                        }
                        onRemove(profile, false)
                    } else {
                        withAnimation {
                            offset = .zero
                        }
                    }
                }
        )
        .animation(.spring(), value: offset)
    }
    
    var profileImageView: some View {
        VStack {
            AsyncImage(url: URL(string: profile.imageURL)) {image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 320, height: 450)
            .background(Color("\(profile.bgColor)"))
            .clipped()
            .cornerRadius(20)
            .shadow(radius: 5)
        }
        .padding()
    }
    
    var nameView: some View {
        VStack {
            VStack(alignment: .leading, spacing: 6) {
                    Text("\(profile.name), \(profile.age)")
                        .font(.title2).bold()
                        .foregroundColor(.white)
                    Text("\(profile.location)")
                        .font(.subheadline).foregroundColor(.white.opacity(0.8))
                    Text(profile.bio)
                        .font(.footnote).foregroundColor(.white)
                        .lineLimit(2)
                NavigationLink(destination: ProfileDetails(profile: profile)) {
                    Text("View Details")
                        .font(.footnote).underline()
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(
                LinearGradient(colors: [.black, .white], startPoint: .bottom, endPoint: .top)
            )
            .cornerRadius(20)
        }
    }
}
