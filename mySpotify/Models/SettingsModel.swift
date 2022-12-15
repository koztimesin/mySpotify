//
//  SettingsModel.swift
//  mySpotify
//
//  Created by koztimesin on 12.12.2022.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
