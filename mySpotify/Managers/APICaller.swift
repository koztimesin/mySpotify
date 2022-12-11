//
//  APICaller.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    public func getCurrentUserProfile(completion: @escaping(Result<UserProfile, Error>) -> Void) {
        
    }
}
