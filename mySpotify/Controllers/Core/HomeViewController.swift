//
//  ViewController.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        
        fetchData()
    }
    
    private func fetchData() {
        APICaller.shared.getNewReleases { result in
            switch result {
            case .success(let model): break
            case .failure(let error): break
            }
        }
    }

    @objc func didTapSettings() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

