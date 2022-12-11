//
//  UserProfile.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import Foundation

struct UserProfile {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Int]
    let external_urls: [String: String]
    let followers: [String: Codable?]
    let href: String
    let id: String
    let images: [UserImage]
    let product: String
}

struct UserImage: Codable {
    let url: String
}
