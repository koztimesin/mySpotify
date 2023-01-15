//
//  LibraryViewController.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import UIKit

class LibraryViewController: UIViewController {
    
    private lazy var playlistsVC = LibraryPlaylistsViewController()
    private lazy var albumsVC = LibraryAlbumsViewController()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.contentSize = CGSize(width: view.frame.size.width * 2, height: scroll.frame.size.height * 2)
        
        return scroll
    }()
    
    private lazy var toggleView = LibraryToggleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        view.addSubview(toggleView)
        
        scrollView.delegate = self
        toggleView.delegate = self
        
        addChildren()
        updateBarButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top + 55,
            width: view.frame.size.width,
            height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 55
        )
        
        toggleView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: 200,
            height: 55
        )
    }
    
    private func addChildren() {
        addChild(playlistsVC)
        scrollView.addSubview(playlistsVC.view)
        playlistsVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.self.height)
        playlistsVC.didMove(toParent: self)
        
        addChild(albumsVC)
        scrollView.addSubview(albumsVC.view)
        albumsVC.view.frame = CGRect(x: view.frame.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.self.height)
        albumsVC.didMove(toParent: self)
    }
    
    private func updateBarButtons() {
        switch toggleView.state {
        case .playlist:
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(didTapAdd)
            )
        case .album:
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc private func didTapAdd() {
        playlistsVC.showCreatePlaylistAlert()
    }
    
}

extension LibraryViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= view.frame.size.width - 100 {
            toggleView.update(for: .album)
            updateBarButtons()
        } else {
            toggleView.update(for: .playlist)
            updateBarButtons()
        }
    }
}

extension LibraryViewController: LibraryToggleViewDelegate {
    
    func libraryToggleViewDidTapPlaylist(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(.zero, animated: true)
        updateBarButtons()
    }
    
    func libraryToggleViewDidTapAlbum(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(CGPoint(x: view.frame.width, y: 0), animated: true)
        updateBarButtons()
    }
    
}
