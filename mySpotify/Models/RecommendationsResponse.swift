//
//  RecommendationsResponse.swift
//  mySpotify
//
//  Created by koztimesin on 17.12.2022.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
