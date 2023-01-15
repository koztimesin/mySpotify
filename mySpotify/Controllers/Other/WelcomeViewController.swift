//
//  WelcomeViewController.swift
//  mySpotify
//
//  Created by koztimesin on 08.12.2022.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "welcome")
        
        return image
    }()
    
    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.7
        
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "pngLogo"))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Listen to Millions\nof Songs on\nthe go."
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "mySpotify"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        view.addSubview(imageView)
        view.addSubview(overlayView)
        view.addSubview(signInButton)
        view.addSubview(vStack)
        vStack.addArrangedSubview(logoImageView)
        vStack.addArrangedSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = view.bounds
        
        overlayView.frame = view.bounds
        
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaInsets)
            make.leading.trailing.equalToSuperview().inset(100)
        }
        
        vStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(120)
            make.centerX.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(success: Bool) {
        guard success else {
            let alert = UIAlertController(title: "Oops", message: "Something went wrong when signing in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel))
            present(alert, animated: true)
            
            return
        }
        
        let mainTabBarVC = TabBarViewController()
        mainTabBarVC.modalPresentationStyle = .fullScreen
        present(mainTabBarVC, animated: true)
    }
    
}
