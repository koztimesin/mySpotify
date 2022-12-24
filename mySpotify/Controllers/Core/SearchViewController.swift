//
//  SearchViewController.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var searchController: UISearchController = {
        let results = UIViewController()
        results.view.backgroundColor = .systemBlue
        let vc = UISearchController(searchResultsController: results)
        vc.searchBar.placeholder = "Songs, Artists, Albums"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
        !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        // Perform Search
        
    }
    
}
