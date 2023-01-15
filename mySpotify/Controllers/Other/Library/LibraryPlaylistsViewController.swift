//
//  LibraryPlaylistsViewController.swift
//  mySpotify
//
//  Created by koztimesin on 13.01.2023.
//

import UIKit

class LibraryPlaylistsViewController: UIViewController {
    
    var playlists = [Playlist]()
    
    private lazy var noPlaylistView = ActionLabelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(noPlaylistView)
        
        setUpNoPlaylistView()
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        noPlaylistView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        noPlaylistView.center = view.center
    }
    
    private func fetchData() {
        APICaller.shared.getCurrentUserPlaylist { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let playlists):
                    self?.playlists = playlists
                    self?.updateUI()
                case .failure(let error): break
                }
            }
        }
    }
    
    private func updateUI() {
        if playlists.isEmpty {
            noPlaylistView.isHidden = false
        } else {
            //show table
        }
    }
    
    private func setUpNoPlaylistView() {
        noPlaylistView.delegate = self
        noPlaylistView.configure(
            with: ActionLabelViewViewModel(
                text: "You don't have any playlists yet.",
                actionTitle: "Create"
            )
        )
    }
    
    public func showCreatePlaylistAlert() {
        let alert = UIAlertController(title: "New Playlist", message: "Enter playlist name", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Playlist..."
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            guard let field = alert.textFields?.first,
                  let text = field.text,
                  !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            
            APICaller.shared.createPlaylist(with: text) { success in
                if success {
                    // refresh playlist list
                } else {
                    print("Failed to create playlist ")
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
}

extension LibraryPlaylistsViewController: ActionLabelViewDelegate {
    
    func actionLabelViewDidTapButton(_ action: ActionLabelView) {
        showCreatePlaylistAlert()
    }
    
}
