//
//  ProfileData.swift
//  POC
//
//  Created by Shivani Pandey on 19/08/25.
//

struct ProfileData: Codable, Identifiable {
    var id: Int
    var name: String
    var age: Int
    var location: String
    var bio: String
    var interests: [String]
    var imageURL: String
    var bgColor: String
    
    init(id: Int, name: String, age: Int, location: String, bio: String, interests: [String], imageURL: String, bgColor: String) {
        self.id = id
        self.name = name
        self.age = age
        self.location = location
        self.bio = bio
        self.interests = interests
        self.imageURL = imageURL
        self.bgColor = bgColor
    }
}


extension ProfileData {
    static let demo = ProfileData(
        id: 999,
        name: "Demo User",
        age: 25,
        location: "Preview City",
        bio: "This is a preview bio for testing the ProfileCardView.",
        interests: ["Music", "Travel", "Cooking"],
        imageURL: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
        bgColor: "#FFA520"
    )
}
