//
//  RegisterFooterView.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit

class RegisterFooterView: UIView {
    // Reference of other class' ViewModel(RegisterViewModel) to this one. Definition on ViewController
    weak var viewModel: RegisterViewModel?
    
    // MARK: - Attributes
    static let height: CGFloat = 200
    
    var clickRegisterButton: (() -> Void)?
    
    
    //MARK: - UIElements
    private lazy var registerButton: UIButton = UIButton.defaultButton(title: "Cadastrar", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(performRegister))
    
    private lazy var loginButton: UIButton = UIButton.transparentButton(title: "Já possui uma conta? Entre aqui", font: .MyTheme.defaultText, target: self, selector: #selector(goToLogin))
    
    private lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = .MyTheme.defaultTextColor
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var termsAndConditionsButton: UIButton = UIButton.transparentButton(title: "Ao criar uma conta você aceita nossos termos e condições", font: .MyTheme.defaultText, target: self, selector: #selector(termsButtonTapped))
    
    //MARK: - Initializer
    init() {
        super.init(frame: .zero)
        self.setupView()
        self.setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setupview and Constraints
    func setupView(){
        self.addSubview(registerButton)
        self.addSubview(loginButton)
        self.addSubview(toggleButton)
        self.addSubview(termsAndConditionsButton)
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            
            toggleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            toggleButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -25),
            toggleButton.centerYAnchor.constraint(equalTo: termsAndConditionsButton.centerYAnchor),
            
            termsAndConditionsButton.leadingAnchor.constraint(equalTo: toggleButton.trailingAnchor, constant: 16),
            termsAndConditionsButton.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor),
            termsAndConditionsButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -25),

            registerButton.topAnchor.constraint(equalTo: self.toggleButton.bottomAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            registerButton.leadingAnchor.constraint(equalTo: toggleButton.leadingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 16),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            loginButton.trailingAnchor.constraint(equalTo: registerButton.trailingAnchor),
            loginButton.leadingAnchor.constraint(equalTo: toggleButton.leadingAnchor),
        ])
    }
    
    //MARK: - Button Perform
    @objc func performRegister(){
        clickRegisterButton?()
        
        viewModel?.addNewClient()
    }
    
    @objc func goToLogin(){
        clickRegisterButton?()
        
        viewModel?.popViewController()
    }
    
    @objc func toggleButtonTapped(){
        clickRegisterButton?()
        
        guard let image = self.toggleButton.currentImage else {return}
        let square = UIImage(systemName: "square")
        let check = UIImage(systemName: "checkmark.square.fill")
        
        if image == square {
            self.toggleButton.setImage(check, for: .normal)
        }
        
        if image == check {
            self.toggleButton.setImage(square, for: .normal)
        }
    }
    
    @objc func termsButtonTapped(){
       
    }
    
    
}
