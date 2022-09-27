//
//  ShowDataTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit

final class ShowDataTableViewCell: UITableViewCell {
    // MARK: - cellID
    static let reuseId: String = "ShowDataTableViewCell"
    
    //MARK: - UIElements
    private lazy var cpfLabel: UILabel = {
       let view = UILabel()
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var editButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = tintColor
        view.setImage(UIImage(systemName: "Person.fill"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setupconstraints
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(nameLabelTitle: String, cpfLabelTitle: String){
        nameLabel.text = nameLabelTitle
        cpfLabel.text = cpfLabelTitle
    }
    
    func setupConstraints(){
        self.addSubview(cpfLabel)
        self.addSubview(nameLabel)
        //self.addSubview(editButton)
        
        
        NSLayoutConstraint.activate([
            cpfLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cpfLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: cpfLabel.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.30),
            
//            editButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
//            editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            editButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.10)
        ])
    }
}
