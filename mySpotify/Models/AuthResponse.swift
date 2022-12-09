//
//  AuthResponse.swift
//  mySpotify
//
//  Created by koztimesin on 09.12.2022.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
