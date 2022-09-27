//
//  MyKeysTableViewCell.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/24/22.
//

import Foundation
import UIKit

class MyKeysTableViewCell: UITableViewCell {
    //MARK: - CellId
    static let reuseId: String = "MyKeysTableViewCell"
    
    //MARK: - UIElements
    private lazy var keyImageView: UIImageView = {
       let view = UIImageView()
        view.tintColor = .MyTheme.mainBlueColor
        view.image = UIImage(systemName: "key")
        //view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var keyTypeLabel: UILabel = {
        let view = UILabel()
        view.text = "Chave Aleatoria"
        view.numberOfLines = -1
        view.font = .MyTheme.myKeysText
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var keyLabel: UILabel = {
       let view = UILabel()
        view.text = "key teste"
        view.font = .MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Function
    func setupView(imageName: String, keyType: String, keyText: String) {
        keyImageView.image = UIImage(named: imageName)
        keyTypeLabel.text = keyType
        keyLabel.text = keyText
    }
    
    //MARK: - Constraints and subviews
    private func setupConstraints() {
        contentView.addSubview(keyImageView)
        contentView.addSubview(keyLabel)
        contentView.addSubview(keyTypeLabel)
        
        NSLayoutConstraint.activate([
            keyImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            keyImageView.heightAnchor.constraint(equalToConstant: 35),
            keyImageView.widthAnchor.constraint(equalToConstant: 35),
            keyImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -13),
            
            keyTypeLabel.centerXAnchor.constraint(equalTo: keyImageView.centerXAnchor),
            keyTypeLabel.widthAnchor.constraint(equalTo: keyImageView.widthAnchor, multiplier: 1.7),
            keyTypeLabel.topAnchor.constraint(equalTo: keyImageView.bottomAnchor, constant: 5),
            
            keyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            keyLabel.leadingAnchor.constraint(equalTo: keyImageView.trailingAnchor, constant: 40)
            
//            keyTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            keyTypeLabel.leadingAnchor.constraint(equalTo: keyImageView.trailingAnchor, constant: 10),
//            keyTypeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
//
//            keyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            keyLabel.leadingAnchor.constraint(equalTo: keyTypeLabel.trailingAnchor, constant: 10)
        ])
    }
}
