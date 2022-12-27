//
//  AllCategoriesResponse.swift
//  mySpotify
//
//  Created by koztimesin on 27.12.2022.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
