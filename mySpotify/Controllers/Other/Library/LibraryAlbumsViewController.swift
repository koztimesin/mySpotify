//
//  LibraryAlbumsViewController.swift
//  mySpotify
//
//  Created by koztimesin on 13.01.2023.
//

import UIKit

class LibraryAlbumsViewController: UIViewController {
    
    var albums = [Album]()
    
    private lazy var noAlbumsView = ActionLabelView()
    
    private var observer: NSObjectProtocol?
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(
            SearchResultSubtitleTableViewCell.self,
            forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier
        )
        table.isHidden = true
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(noAlbumsView)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpNoAlbumsView()
        
        fetchData()
        
        observer = NotificationCenter.default.addObserver(
            forName: .albumSavedNotification,
            object: nil,
            queue: .main,
            using: { [weak self] _ in
                self?.fetchData()
            })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        noAlbumsView.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.center.equalToSuperview()
        }
        
        tableView.frame = view.bounds
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true)
    }
    
    private func fetchData() {
        albums.removeAll()
        APICaller.shared.getCurrentUserAlbums { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let albums):
                    self?.albums = albums
                    self?.updateUI()
                case .failure(let error): break
                }
            }
        }
    }
    
    private func updateUI() {
        if albums.isEmpty {
            noAlbumsView.isHidden = false
            tableView.isHidden = true
        } else {
            tableView.reloadData()
            noAlbumsView.isHidden = true
            tableView.isHidden = false
        }
    }
    
    private func setUpNoAlbumsView() {
        noAlbumsView.delegate = self
        noAlbumsView.configure(
            with: ActionLabelViewViewModel(
                text: "You don't have any saved albums yet.",
                actionTitle: "Browse"
            )
        )
    }
    
}

extension LibraryAlbumsViewController: ActionLabelViewDelegate {
    
    func actionLabelViewDidTapButton(_ action: ActionLabelView) {
        tabBarController?.selectedIndex = 0
    }
    
}

extension LibraryAlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchResultSubtitleTableViewCell.identifier,
            for: indexPath
        ) as? SearchResultSubtitleTableViewCell else {
            return UITableViewCell()
        }
        let album = albums[indexPath.row]
        cell.configure(
            with: SearchResultSubtitleTableViewCellViewModel(
                title: album.name,
                subtitle: album.artists.first?.name ?? "-",
                imageURL: URL(string: album.images.first?.url ?? "")
            )
        )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        HapticsManager.shared.vibrateForSelection()
        tableView.deselectRow(at: indexPath, animated: true)
        let album = albums[indexPath.row]
        
        let vc = AlbumViewController(album: album)
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}
