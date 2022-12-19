//
//  FeaturedPlaylistsCollectionViewCell.swift
//  mySpotify
//
//  Created by koztimesin on 18.12.2022.
//

import UIKit

class FeaturedPlaylistsCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistsCollectionViewCell"
    
    private lazy var playlistCoverImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var playlistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var creatorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playlistNameLabel.sizeToFit()
        creatorNameLabel.sizeToFit()
        
        playlistCoverImageView.snp.makeConstraints { make in
            make.width.height.equalToSuperview().dividedBy(1.5)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(5)
        }
        
        playlistNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(playlistCoverImageView.snp.bottom).offset(10)
        }
        
        creatorNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(playlistNameLabel.snp.bottom).offset(5)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        playlistNameLabel.text = nil
        creatorNameLabel.text = nil
        playlistCoverImageView.image = nil
    }
    
    func configure(with viewModel: FeaturedPlaylistsCellViewModel) {
        playlistNameLabel.text = viewModel.name
        creatorNameLabel.text = viewModel.creatorName
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL)
    }
    
    private func setupView() {
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(creatorNameLabel)
        
        contentView.clipsToBounds = true
    }
}
