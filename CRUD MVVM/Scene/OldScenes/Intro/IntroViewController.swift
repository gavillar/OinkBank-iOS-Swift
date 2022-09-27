////
////  ViewController.swift
////  CRUD MVVM
////
////  Created by user210203 on 4/28/22.
////
//
//import UIKit
//import CoreData
//
//class IntroViewController: UIViewController {
//    private lazy var viewModel = IntroViewModel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        viewModel.fetchData()
//        viewModel.fetchDataPix()
//    }
//
//    //MARK: - loadview
//    override func loadView() {
//        super.loadView()
//        self.setupView()
//    }
//
//    //MARK: - button action
//    var clickRegisterButton: (() -> Void)?
//    var clickShowDataButton: (() -> Void)?
//
//    //MARK: - UIElements
//    private lazy var backgroundImage: UIImageView = {
//        let view = UIImageView()
//        view.image = UIImage(named: "bkgImage")
//        view.contentMode = .scaleAspectFill
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var loginButton: UIButton = {
//        let view = UIButton()
//        view.backgroundColor = UIColor.MyTheme.whiteTextColor
//        view.tintColor = UIColor.MyTheme.mainPinkColor
//        view.setTitleColor(.tintColor, for: .normal)
//        view.setTitle("Entre na sua conta", for: .normal)
//        view.titleLabel?.font = UIFont.MyTheme.defaultText
//        view.addTarget(self, action: #selector(self.performLogin), for: .touchUpInside)
//        view.layer.cornerRadius = 5
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var signInButton: UIButton = {
//        let view = UIButton()
//        view.backgroundColor = nil
//        view.tintColor = UIColor.MyTheme.whiteTextColor
//        view.setTitleColor(.tintColor, for: .normal)
//        view.setTitle("Criar uma conta", for: .normal)
//        view.titleLabel?.font = UIFont.MyTheme.defaultText
//        view.addTarget(self, action: #selector(self.performRegister), for: .touchUpInside)
//        view.layer.cornerRadius = 5
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//
//    // MARK: - Initializer
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        self.setupView()
//        self.setupLayoutConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - setupView and constraints
//    private func setupView(){
//        view.addSubview(backgroundImage)
//        view.addSubview(loginButton)
//        view.addSubview(signInButton)
//    }
//
//    private func setupLayoutConstraints(){
//        NSLayoutConstraint.activate([
//            backgroundImage.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//            backgroundImage.heightAnchor.constraint(equalTo: self.view.heightAnchor),
//
//            signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80),
//            signInButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70),
//            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//
//            loginButton.widthAnchor.constraint(equalTo: signInButton.widthAnchor),
//            loginButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -5),
//            loginButton.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor)
//        ])
//    }
//
//    //MARK: - Perform
//    @objc func performRegister(){
//        self.clickRegisterButton?()
//
//        let registerViewController = RegisterViewController()
//        self.navigationController?.pushViewController(registerViewController, animated: true)
//    }
//
//    @objc func performShowData(){
//        self.clickShowDataButton?()
//
//        let showDataViewController = ShowDataViewController()
//        self.navigationController?.pushViewController(showDataViewController, animated: true)
//    }
//
//    @objc func performLogin(){
//
//        let LoginViewController = LoginViewController()
//        self.navigationController?.pushViewController(LoginViewController, animated: true)
//    }
//
//}
//
