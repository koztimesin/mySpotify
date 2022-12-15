//
//  ProfileViewController.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import UIKit
import SDWebImage
import SnapKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private lazy var models = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        title = "Profile"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        fetchProfile()
    }
    
    private func fetchProfile() {
        APICaller.shared.getCurrentUserProfile { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.updateUI(with: model)
                case .failure(let error):
                    print("Profile Error: \(error.localizedDescription)")
                    self?.failedToGetProfile()
                }
            }
        }
    }
    
    private func updateUI(with model: UserProfile) {
        tableView.isHidden = false
        
        //Configure table models
        models.append("Full Name: \(model.display_name)")
        models.append("Email address: \(model.email)")
        models.append("ID: \(model.id)")
        models.append("Plan: \(model.product)")
        models.append("Image: \(model.images.count)")
        createTableHeader(with: model.images.first?.url)
//        createTableHeader(with: "https://img.freepik.com/free-vector/dog-with-drawn-suit_79603-538.jpg")
        
        tableView.reloadData()
    }
    
    private func createTableHeader(with string: String?) {
        guard let urlString = string, let url = URL(string: urlString) else { return }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.width / 1.5)))
        
        let imageSize: CGFloat = headerView.frame.height / 2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        
        headerView.addSubview(imageView)
        imageView.center = headerView.center
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: url)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize / 2
        
        tableView.tableHeaderView = headerView
    }
    
    private func failedToGetProfile() {
        let label = UILabel()
        label.text = "Failed to get profile"
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
