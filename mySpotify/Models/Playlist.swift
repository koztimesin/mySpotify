//
//  Playlist.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
