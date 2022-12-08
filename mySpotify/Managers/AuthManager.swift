//
//  AuthManager.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "3c1fb056329e466787e6ac588666fa8d"
        static let clientSecret = "71ba6c8eb1c846928ddfdfc630f2b7fa"
    }
    
    private init() {
        
    }
    
    public var signInURL: URL? {
        let base = "https://accounts.spotify.com/authorize"
        let scope = "user-read-private"
        let redirectURI = "https://github.com/koztimesin"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        false
    }
    
    private var accessToken: String? {
        nil
    }
    
    private var refreshToken: String? {
        nil
    }
    
    private var tokenExpirationDate: Date? {
        nil
    }
    
    private var shouldRefreshToken: Bool {
        false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)) {
        
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
}
