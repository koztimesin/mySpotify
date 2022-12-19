//
//  NewReleasesCollectionViewCell.swift
//  mySpotify
//
//  Created by koztimesin on 18.12.2022.
//

import UIKit
import SnapKit
import SDWebImage

class NewReleasesCollectionViewCell: UICollectionViewCell {
    static let identifier = "NewReleasesCollectionViewCell"
    
    private lazy var albumCoverImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var numberOfTracksLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
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
        
        albumNameLabel.sizeToFit()
        artistNameLabel.sizeToFit()
        numberOfTracksLabel.sizeToFit()
        
        albumCoverImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(3)
            make.centerY.equalToSuperview()
        }
        
        numberOfTracksLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumCoverImageView).offset(130)
            make.bottom.equalToSuperview().inset(10)
        }
        
        albumNameLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(5)
            make.leading.equalTo(albumCoverImageView).inset(130)
        }
        
        artistNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumCoverImageView).inset(130)
            make.top.equalTo(albumNameLabel.snp.bottom).offset(10)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        albumNameLabel.text = nil
        artistNameLabel.text = nil
        numberOfTracksLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    func configure(with viewModel: NewReleasesCellViewModel) {
        albumNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        numberOfTracksLabel.text = "Tracks: \(viewModel.numberOfTracks)"
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL)
    }
    
    private func setupView() {
        contentView.backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(numberOfTracksLabel)
        contentView.addSubview(artistNameLabel)
        
        contentView.clipsToBounds = true
    }
}
