//
//  CopyAndPastView.swift
//  CRUD MVVM
//
//  Created by user220212 on 5/26/22.
//

import UIKit

class CopyAndPasteView: UIView {
    
    var continueAction: (() -> Void)?
    var deleteAction: (() -> Void)?
  
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "Insira o Pix copia e cola"
        view.font = .MyTheme.defaultText
        view.textColor = .MyTheme.defaultTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Pix Copia e Cola"
        view.font = .MyTheme.defaultText
        view.clearsOnBeginEditing = true
        view.clearButtonMode = .whileEditing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = UIFont.MyTheme.defaultText
        button.setTitleColor(UIColor.MyTheme.blackColor, for: .normal)
        button.backgroundColor = UIColor.MyTheme.mainGreenButtonColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(self.performConfirm), for: .touchUpInside)
        
        return button
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
        self.addSubview(label)
        self.addSubview(textField)
        self.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.textField.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 16),
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupAditionalConfig() {
        self.backgroundColor = .systemBackground
    }
    
    @objc private func performConfirm() {
        self.continueAction?()
    }
    
    @objc private func performDelete() {
        self.deleteAction?()
    }

    public func configureTextField(text: String) {
        self.textField.text = text
    }
    
    public func getText() -> String {
        
        return textField.text ?? ""
    }
}
