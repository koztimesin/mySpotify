//
//  UserProfile.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
    let href: String
    let id: String
    let images: [APIImage]
    let product: String
}
