//
//  LoginViewController.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .MyTheme.backgroundColor
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.agencyTextField.addBottomLineWithColor(color: .MyTheme.defaultTextColor, width: 1.0)
        self.accountTextField.addBottomLineWithColor(color: .MyTheme.defaultTextColor, width: 1.0)
        self.passwordTextField.addBottomLineWithColor(color: .MyTheme.defaultTextColor, width: 1.0)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        agencyTextField.text = ""
        accountTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: - UI Elements
    
    private lazy var welcomeLabel: UILabel = {
        let view = UILabel()
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.MyTheme.boldTitleText, NSAttributedString.Key.foregroundColor : UIColor.white]
        let attrs2 = [NSAttributedString.Key.font : UIFont.MyTheme.boldTitleText, NSAttributedString.Key.foregroundColor : UIColor.black]
        let attrs3 = [NSAttributedString.Key.font : UIFont.MyTheme.boldTitleText, NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let atritutedString1 = NSMutableAttributedString(string: "Seja bem-vindo ao ", attributes: attrs1 as [NSAttributedString.Key : Any])
        let atritutedString2 = NSMutableAttributedString(string: "\nOinkBank ", attributes: attrs2 as [NSAttributedString.Key : Any])
        let atritutedString3 = NSMutableAttributedString(string: ", seu \nmais novo banco.", attributes: attrs3 as [NSAttributedString.Key : Any])
        
        
        atritutedString1.append(atritutedString2)
        atritutedString1.append(atritutedString3)
        view.numberOfLines = 3
        view.attributedText = atritutedString1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var rectangleImage: UIImageView = {
        let wallpapper = UIImageView()
        wallpapper.tintColor = .MyTheme.mainBlueColor
        wallpapper.translatesAutoresizingMaskIntoConstraints = false
        wallpapper.image = UIImage(named: "Rectangle")
        return wallpapper
    }()
    
    
    //Label
    private lazy var agencyLabel: UILabel = {
        let view = UILabel()
        view.textColor = .MyTheme.defaultTextColor
        //.MyTheme.whiteTextColor
        view.font = .MyTheme.defaultText
        view.text = "Agência"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountLabel: UILabel = {
        let view = UILabel()
        view.textColor = .MyTheme.defaultTextColor
        //.MyTheme.whiteTextColor
        view.text = "Conta com dígito"
        view.font = .MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //TextField
    private lazy var agencyTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.placeholder = "1-9"
        view.backgroundColor = .clear
        view.textColor = .MyTheme.defaultTextColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var accountTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.placeholder = "1-9"
        view.backgroundColor = .clear
        view.textColor = .MyTheme.defaultTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - password label and textfield
    private lazy var passwordLabel: UILabel = {
        let view = UILabel()
        view.textColor = .MyTheme.defaultTextColor
        view.font = .MyTheme.defaultText
        view.text = "Senha"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "******"
        view.backgroundColor = .clear
        view.textColor = .MyTheme.defaultTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = true
        return view
    }()
    
    // MARK: - login button
    
        private lazy var loginButton: UIButton = UIButton.defaultButton(title: "Entrar", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(performLogin))
    
    //MARK: -register button
    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.tintColor = .MyTheme.defaultTextColor
        view.setTitleColor(.tintColor, for: .normal)
        view.setTitle("Não tem conta? Cadastre-se", for: .normal)
        view.titleLabel?.font = .MyTheme.defaultText
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(registerTapButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - register tap button
    @objc func registerTapButton(){
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    
    
    //MARK: - logo imageview
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .MyTheme.whiteTextColor
        view.image = UIImage(named: "logo pig")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //MARK: - init
    init(){
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupConstraints()
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView
    private func setupView(){
        
        view.addSubview(rectangleImage)
        view.addSubview(welcomeLabel)
        view.addSubview(agencyLabel)
        view.addSubview(accountLabel)
        view.addSubview(agencyTextField)
        view.addSubview(accountTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(logoImageView)
        view.addSubview(registerButton)
    }
    
    //MARK: - Constraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            
            rectangleImage.topAnchor.constraint(equalTo: view.topAnchor),
            rectangleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rectangleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rectangleImage.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.41),
            rectangleImage.bottomAnchor.constraint(equalTo: view.centerYAnchor,constant: -16),
            
            logoImageView.topAnchor.constraint(equalTo: rectangleImage.bottomAnchor,constant: -16),
            logoImageView.centerXAnchor.constraint(equalTo: self.loginButton.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            
            agencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            agencyLabel.bottomAnchor.constraint(equalTo: agencyTextField.topAnchor,constant: -16),
            
            accountLabel.topAnchor.constraint(equalTo: agencyLabel.topAnchor),
            accountLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            
            agencyTextField.topAnchor.constraint(equalTo: agencyLabel.bottomAnchor, constant: 16),
            agencyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            agencyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            accountTextField.topAnchor.constraint(equalTo: agencyTextField.topAnchor),
            accountTextField.leadingAnchor.constraint(equalTo: agencyTextField.trailingAnchor,constant: 16),
            accountTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            passwordLabel.topAnchor.constraint(equalTo: agencyTextField.bottomAnchor,constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -16),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16)
        ])
    }
    
    //MARK: - button perform
    @objc func performLogin(){
        viewModel.loginPassword = passwordTextField.text ?? ""
        viewModel.loginAccount = accountTextField.text ?? ""
        viewModel.loginAgency = agencyTextField.text ?? ""
        
        viewModel.doLogin()
    }
}

//MARK: - Delegate
extension LoginViewController: LoginViewModelDelegate {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    func onSuccessPush() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}




