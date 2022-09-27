//
//  PixHomeTableViewCell.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 19/05/22.
//

import UIKit

class PixHomeTableViewCell: UITableViewCell {
    //MARK: - CellId
    static let reuseId: String = "PixHomeTableViewCell"
    
    //MARK: - UIElements
    private lazy var keyImageView: UIImageView = {
       let view = UIImageView()
        view.tintColor = .systemPink
        view.image = UIImage(systemName: "key")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var keyTypeLabel: UILabel = {
        let view = UILabel()
        view.text = "Chave Aleatoria"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var keyLabel: UILabel = {
       let view = UILabel()
        view.text = "key teste"
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
        keyImageView.image = UIImage(systemName: imageName)
        keyTypeLabel.text = keyType
        keyLabel.text = keyText
    }
    
    //MARK: - Constraints and subviews
    private func setupConstraints() {
        contentView.addSubview(keyImageView)
        contentView.addSubview(keyLabel)
        contentView.addSubview(keyTypeLabel)
        
        NSLayoutConstraint.activate([
            keyImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            keyImageView.heightAnchor.constraint(equalToConstant: 30),
            keyImageView.widthAnchor.constraint(equalToConstant: 30),
            keyImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            keyTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            keyTypeLabel.leadingAnchor.constraint(equalTo: keyImageView.trailingAnchor, constant: 10),
            keyTypeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            
            keyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            keyLabel.leadingAnchor.constraint(equalTo: keyTypeLabel.trailingAnchor, constant: 10)
        ])
    }
}
