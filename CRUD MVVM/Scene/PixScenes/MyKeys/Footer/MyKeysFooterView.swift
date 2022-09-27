////
////  MyKeysFooterView.swift
////  CRUD MVVM
////
////  Created by user217586 on 5/24/22.
////
//
//import UIKit
//
//class MyKeysFooterView: UIView {
//
//    static let Height: CGFloat = 40
//
//    weak var viewModel: MyKeysViewModel?
//
//    //MARK: - UIElements
//    private lazy var registerKeyButton: UIButton = {
//       let view = UIButton()
//        view.backgroundColor = .systemPink
//        view.setTitle("Cadastrar nova chave", for: .normal)
//        view.layer.cornerRadius = 5
//        view.addTarget(self, action: #selector(performGoToRegister), for: .touchUpInside)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    //MARK: - init
//    init(){
//        super.init(frame: .zero)
//        self.backgroundColor = .systemBackground
//        setupView()
//        setupLayoutConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    //MARK: - setupView
//    private func setupView(){
//        self.addSubview(registerKeyButton)
//    }
//
//    //MARK: - setupLayoutConstraints
//    private func setupLayoutConstraints() {
//        NSLayoutConstraint.activate([
//            registerKeyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            registerKeyButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
//            registerKeyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
//        ])
//    }
//
//    //MARK: - Perform
//    @objc func performGoToRegister() {
//        viewModel?.goToRegisterPix()
//    }
//}
