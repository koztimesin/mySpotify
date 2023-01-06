//
//  PlayerViewController.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import UIKit
import SnapKit

class PlayerViewController: UIViewController {
    
    //    private lazy var imageView: UIImageView = {
    //        let image = UIImageView()
    //        image.contentMode = .scaleAspectFill
    //        image.backgroundColor = .systemPink
    //
    //        return image
    //    }()
    
    private lazy var imageView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        configureBarButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(300)
        }
    }
    
    private func configureBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapAction))
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true)
    }
    
    @objc private func didTapAction() {
        // Actions
    }
    
}
