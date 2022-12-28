//
//  SearchResult.swift
//  mySpotify
//
//  Created by koztimesin on 28.12.2022.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
