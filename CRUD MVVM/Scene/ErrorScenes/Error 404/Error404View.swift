//
//  Error404View.swift
//  CRUD MVVM
//
//  Created by user220212 on 6/14/22.
//

import UIKit

class Error404View: UIView {
    
    var tryAgainAction: (() -> Void)?
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Esses não são os porcos \nque você estava procurando!"
        view.numberOfLines = 0
        view.font = UIFont.MyTheme.homeHeaderText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Caso precise, entre em contato \ncom o suporte."
        view.numberOfLines = 0
        view.font = UIFont.MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tryAgainButton: UIButton = UIButton.defaultButton(title: "Tentar Novamente", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(performTryAgain))
        
    
    private lazy var error404Image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "404image")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vrau: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "agrupado")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        setupAditionalConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(error404Image)
        self.addSubview(vrau)
        self.addSubview(tryAgainButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            
            self.error404Image.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 20),
            self.error404Image.leadingAnchor.constraint(equalTo: self.subtitleLabel.leadingAnchor),
            
            self.vrau.topAnchor.constraint(equalTo: self.error404Image.bottomAnchor), 
            self.vrau.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.vrau.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.vrau.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.tryAgainButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            self.tryAgainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            self.tryAgainButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),

        ])
    }
    
    private func setupAditionalConfig() {
        self.backgroundColor = .systemBackground
    }
    
    @objc private func performTryAgain() {
        self.tryAgainAction?()
    }
}
