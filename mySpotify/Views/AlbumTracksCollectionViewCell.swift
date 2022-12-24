//
//  AlbumTracksCollectionViewCell.swift
//  mySpotify
//
//  Created by koztimesin on 24.12.2022.
//

import UIKit

class AlbumTracksCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumTracksCollectionViewCell"
    
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
        
        trackNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
        artistNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(trackNameLabel.snp.bottom).offset(5)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        trackNameLabel.text = nil
        artistNameLabel.text = nil
    }
    
    func configure(with viewModel: AlbumTracksCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
    }
    
    private func setupView() {
        backgroundColor = .secondarySystemBackground
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistNameLabel)
        
        contentView.clipsToBounds = true
    }
}
