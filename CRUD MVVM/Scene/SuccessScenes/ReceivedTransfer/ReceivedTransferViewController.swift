//
//  ReceivedTransfer.swift
//  CRUD MVVM
//
//  Created by user217584 on 20/06/22.
//

import Foundation
import UIKit

class ReceivedTransferViewController: UIViewController {
    
    //MARK: - Labels
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "Transferência recebida!"
        lb.font = .MyTheme.boldTitleText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 2
        lb.text = "Você recebeu uma transferência e já está disponível em sua conta."
        lb.font = .MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .left
        return lb
    }()
    
    //MARK: - Image
    
    lazy var happyPigImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "receivedTransferImage")
        image.contentMode = .scaleToFill
        return image
    }()
    
    //MARK: - Button
    
    private lazy var backButton: UIButton = UIButton.defaultButton(title: "Voltar", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(back))
    
    
    //MARK: - Button Action
    
    @objc func back(sender:UIButton){
        
    }
    
    //MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    //MARK: - loadView
    
    override func loadView() {
        super.loadView()
        addSubviews()
        configConstraints()
    }
    
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .MyTheme.backgroundColor

    }
    
    //MARK: - Func addSubviews
    
    private func addSubviews() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(subtitleLabel)
        self.view.addSubview(happyPigImage)
        self.view.addSubview(backButton)
    }
    
    //MARK: - Constraints
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
        self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        
        self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
        self.subtitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        self.subtitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        
        self.happyPigImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 60),
        self.happyPigImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        
        self.backButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        self.backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        self.backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        ])
    }
    
}
