//
//  LibraryToggleView.swift
//  mySpotify
//
//  Created by koztimesin on 15.01.2023.
//

import UIKit

protocol LibraryToggleViewDelegate: AnyObject {
    func libraryToggleViewDidTapPlaylist(_ toggleView: LibraryToggleView)
    func libraryToggleViewDidTapAlbum(_ toggleView: LibraryToggleView)
}

enum State {
    case playlist
    case album
}

class LibraryToggleView: UIView {
    
    weak var delegate: LibraryToggleViewDelegate?
    
    var state: State = .playlist
    
    private lazy var playlistButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Playlists", for: .normal)
        button.addTarget(self, action: #selector(didTapPlaylist), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var albumButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Albums", for: .normal)
        button.addTarget(self, action: #selector(didTapAlbum), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(playlistButton)
        addSubview(albumButton)
        addSubview(indicatorView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playlistButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        albumButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.left.equalTo(playlistButton.snp.right)
        }
        
        layoutIndicator()
    }
    
    @objc private func didTapPlaylist() {
        state = .playlist
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
        delegate?.libraryToggleViewDidTapPlaylist(self)
    }
    
    @objc private func didTapAlbum() {
        state = .album
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
        delegate?.libraryToggleViewDidTapAlbum(self)
    }
    
    private func layoutIndicator() {
        switch state {
        case .playlist:
            indicatorView.frame = CGRect(
                x: 0,
                y: playlistButton.frame.maxY,
                width: 100,
                height: 3
            )
        case .album:
            indicatorView.frame = CGRect(
                x: 100,
                y: playlistButton.frame.maxY,
                width: 100,
                height: 3
            )
        }
    }
    
    func update(for state: State) {
        self.state = state
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
    }
    
}
