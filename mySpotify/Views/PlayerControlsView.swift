//
//  PlayerControlsView.swift
//  mySpotify
//
//  Created by koztimesin on 06.01.2023.
//

import UIKit

protocol PlayerControlsViewDelegate: AnyObject {
    func PlayerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView)
    func PlayerControlsViewDidTapForwardButton(_ playerControlsView: PlayerControlsView)
    func PlayerControlsViewDidTapBackwardButton(_ playerControlsView: PlayerControlsView)
}

final class PlayerControlsView: UIView {
    
    weak var delegate: PlayerControlsViewDelegate?
    
    private lazy var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        
        return slider
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Kill This Love"
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "BLACKPINK"
        
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(
            UIImage(
                systemName: "backward.fill",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 34,
                    weight: .regular
                )
            ),
            for: .normal
        )
        
        return button
    }()
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(
            UIImage(
                systemName: "pause.fill",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 34,
                    weight: .regular
                )
            ),
            for: .normal
        )
        
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(
            UIImage(
                systemName: "forward.fill",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 34,
                    weight: .regular
                )
            ),
            for: .normal
        )
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(volumeSlider)
        
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        
        addSubview(backButton)
        addSubview(playPauseButton)
        addSubview(nextButton)
        
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
        }
        
        volumeSlider.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
        }
        
        playPauseButton.snp.makeConstraints { make in
            make.top.equalTo(volumeSlider.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(volumeSlider.snp.bottom).offset(50)
            make.right.equalTo(playPauseButton).inset(100)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(volumeSlider.snp.bottom).offset(50)
            make.left.equalTo(playPauseButton).offset(100)
        }
    }
    
    @objc private func didTapBack() {
        delegate?.PlayerControlsViewDidTapBackwardButton(self)
    }
    
    @objc private func didTapPlayPause() {
        delegate?.PlayerControlsViewDidTapPlayPauseButton(self)
    }
    
    @objc private func didTapNext() {
        delegate?.PlayerControlsViewDidTapForwardButton(self)
    }
}
