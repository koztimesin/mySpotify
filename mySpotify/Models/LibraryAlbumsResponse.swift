//
//  LibraryAlbumsResponse.swift
//  mySpotify
//
//  Created by koztimesin on 15.01.2023.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
