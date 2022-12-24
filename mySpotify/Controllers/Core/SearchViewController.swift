//
//  SearchViewController.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var searchController: UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultsViewController())
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
        guard let resultsController = searchController.searchResultsController as? SearchResultsViewController,
              let query = searchController.searchBar.text,
        !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
//        resultsController.update(with: results)
        print(query)
        // Perform Search
//        APICaller.shared.search
    }
    
}
