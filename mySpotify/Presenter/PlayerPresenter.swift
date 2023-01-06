//
//  PlayerPresenter.swift
//  mySpotify
//
//  Created by koztimesin on 06.01.2023.
//

import UIKit

final class PlayerPresenter {
    
    static func startPlayer(from viewController: UIViewController, track: AudioTrack) {
        let vc = PlayerViewController()
        vc.title = track.name
        
        viewController.present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    static func startPlayer(from viewController: UIViewController, album: [AudioTrack]) {
        let vc = PlayerViewController()
        
        viewController.present(UINavigationController(rootViewController: vc), animated: true)
    }
}
