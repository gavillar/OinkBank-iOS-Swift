//
//  RegisterTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit

final class RegisterTableViewCell: UITableViewCell {
    // MARK: - cellID
    static let reuseId: String = "RegisterTableViewCell"
    
    // MARK: = UI elements
    //titlelabel
    private lazy var titleLabel: UILabel = {
       let view = UILabel()
        view.font = UIFont.MyTheme.defaultText
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //textfield
    lazy var registerTextField: UITextField = {
       let view = UITextField()
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = false
        
        view.rightView = accessoryAlertImageView
        view.rightViewMode = .always
        
        return view
    }()
    
    // MARK: - alert elements
    lazy var accessoryAlertImageView: UIImageView = {
        //added on registertextfield
        let view = UIImageView()
        view.tintColor = .MyTheme.deleteTextColor
        let image = UIImage(named: "registerTextFieldAlertImage")
        //let image = UIImage(systemName: "key")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var tipLabel: UILabel = {
        let view = UILabel()
        view.text = "Aqui está sua dica"
        view.font = .MyTheme.tipText
        view.textColor = .MyTheme.deleteTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    
    // MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setupconstraints
        setupConstraints()
        
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setupView(title: String, placeholder: String, keyboardType: UIKeyboardType, isSecure: Bool){
        titleLabel.text = title
        registerTextField.placeholder = placeholder
        registerTextField.keyboardType = keyboardType
        registerTextField.isSecureTextEntry = isSecure
    }
    
    // MARK: - Contraints and subviews
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(registerTextField)
        contentView.addSubview(tipLabel)
        
        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            titleLabel.widthAnchor.constraint(equalToConstant: 110),
            titleLabel.bottomAnchor.constraint(equalTo: registerTextField.topAnchor, constant: 5),
            
            registerTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            registerTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            registerTextField.bottomAnchor.constraint(equalTo: self.tipLabel.topAnchor),
//            registerTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            registerTextField.heightAnchor.constraint(equalToConstant: 30),
            
            tipLabel.widthAnchor.constraint(equalTo: registerTextField.widthAnchor),
            tipLabel.centerXAnchor.constraint(equalTo: registerTextField.centerXAnchor),
            tipLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
