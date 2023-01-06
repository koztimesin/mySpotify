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
    
    private lazy var controlsView = PlayerControlsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlsView)
        configureBarButtons()
        
        controlsView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.height.equalTo(view.snp.width)
        }
        
        controlsView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
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

extension PlayerViewController: PlayerControlsViewDelegate {
    
    func PlayerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView) {
        
    }
    
    func PlayerControlsViewDidTapForwardButton(_ playerControlsView: PlayerControlsView) {
        
    }
    
    func PlayerControlsViewDidTapBackwardButton(_ playerControlsView: PlayerControlsView) {
        
    }
    
}
