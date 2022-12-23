//
//  RecommendedTracksCollectionViewCell.swift
//  mySpotify
//
//  Created by koztimesin on 18.12.2022.
//

import UIKit

class RecommendedTracksCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommendedTracksCollectionViewCell"
    
    private lazy var trackCoverImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var artistNameLabel: UILabel = {
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
        
        trackNameLabel.sizeToFit()
        artistNameLabel.sizeToFit()
        
        trackCoverImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.width.equalTo(contentView.snp.height).offset(5)
        }
        
        trackNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalTo(trackCoverImageView.snp.trailing).offset(10)
        }
        
        artistNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(trackCoverImageView.snp.trailing).offset(10)
            make.top.equalTo(trackNameLabel.snp.bottom).offset(5)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        trackNameLabel.text = nil
        artistNameLabel.text = nil
        trackCoverImageView.image = nil
    }
    
    func configure(with viewModel: RecommendedTracksCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        trackCoverImageView.sd_setImage(with: viewModel.artworkURL)
    }
    
    private func setupView() {
        backgroundColor = .secondarySystemBackground
        contentView.addSubview(trackCoverImageView)
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistNameLabel)
        
        contentView.clipsToBounds = true
    }
}
