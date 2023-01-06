//
//  PlayerPresenter.swift
//  mySpotify
//
//  Created by koztimesin on 06.01.2023.
//

import UIKit

protocol PlayerDataSource: AnyObject {
    var songName: String? { get }
    var subtitle: String? { get }
    var imageURL: URL? { get }
}

final class PlayerPresenter {
    
    static let shared = PlayerPresenter()
    
    private var track: AudioTrack?
    private var tracks = [AudioTrack]()
    
    var currentTrack: AudioTrack? {
        if let track = track, tracks.isEmpty {
            return track
        } else if !tracks.isEmpty {
            return tracks.first
        }
        
        return nil
    }
    
    func startPlayer(from viewController: UIViewController, track: AudioTrack) {
        let vc = PlayerViewController()
        vc.dataSource = self
        vc.title = track.name
        
        self.track = track
        self.tracks = []
        
        viewController.present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    func startPlayer(from viewController: UIViewController, tracks: [AudioTrack]) {
        let vc = PlayerViewController()
        
        self.tracks = tracks
        self.track = nil
        
        viewController.present(UINavigationController(rootViewController: vc), animated: true)
    }
}

extension PlayerPresenter: PlayerDataSource {
    
    var songName: String? {
        currentTrack?.name
    }
    
    var subtitle: String? {
        currentTrack?.artists.first?.name
    }
    
    var imageURL: URL? {
        URL(string: currentTrack?.album?.images.first?.url ?? "")
    }
    
}
