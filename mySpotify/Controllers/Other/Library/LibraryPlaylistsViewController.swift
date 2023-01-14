//
//  LibraryPlaylistsViewController.swift
//  mySpotify
//
//  Created by koztimesin on 13.01.2023.
//

import UIKit

class LibraryPlaylistsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        
        APICaller.shared.getCurrentUserPlaylist { result in
            switch result {
            case .success(let playlists): break
            case .failure(let error): break
            }
        }
    }

}
