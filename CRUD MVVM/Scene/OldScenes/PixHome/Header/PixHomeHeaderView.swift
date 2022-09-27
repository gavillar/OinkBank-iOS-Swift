//
//  PixHomeHeaderView.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 19/05/22.
//

import UIKit

class PixHomeHeaderView: UIView {
    weak var viewModel: PixHomeViewModel?
    
    static let height: CGFloat = 180
    
    //MARK: - UIElements
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Envie e receba pagamentos a qualquer hora, sem ser cobrado por isso."
        view.font = .boldSystemFont(ofSize: 17)
        view.numberOfLines = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Fast Action Buttons
    private lazy var transferPixButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 5
        view.setImage(UIImage(systemName: "brazilianrealsign.circle.fill"), for: .normal)
        view.setTitle("Transferir", for: .normal)
        view.backgroundColor = .systemGray5
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var copyPastePixButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 5
        view.setImage(UIImage(systemName: "doc.text.fill"), for: .normal)
        view.setTitle("Pix Copia e Cola", for: .normal)
        view.backgroundColor = .systemGray5
        view.tintColor = .systemPink
        view.titleLabel?.font = .systemFont(ofSize: 14)
        view.titleLabel?.numberOfLines = 2
        view.titleLabel?.textAlignment = .center
        view.setTitleColor(.systemPink, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addPixKeyButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 5
        view.setImage(UIImage(systemName: "key.fill"), for: .normal)
        view.setTitle("Cadastrar Chave", for: .normal)
        view.backgroundColor = .systemGray5
        view.tintColor = .systemPink
        view.setTitleColor(.systemPink, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 14)
        view.titleLabel?.numberOfLines = 2
        view.titleLabel?.textAlignment = .center
        view.addTarget(self, action: #selector(performGoToRegisterPix), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - pixKey elements
    private lazy var yourKeysLabel: UILabel = {
        let view = UILabel()
        view.text = "Suas chaves do Pix:"
        //view.textColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView
    func setupView() {
        
    }
    
    func addSubView() {
        self.addSubview(descriptionLabel)
        self.addSubview(addPixKeyButton)
        self.addSubview(transferPixButton)
        self.addSubview(copyPastePixButton)
        self.addSubview(yourKeysLabel)
    }
    
    //MARK: - setup constraints
    func setupConstraints(){
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            addPixKeyButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.28),
            addPixKeyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addPixKeyButton.heightAnchor.constraint(equalToConstant: 50),
            addPixKeyButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            
            transferPixButton.widthAnchor.constraint(equalTo: addPixKeyButton.widthAnchor),
            transferPixButton.heightAnchor.constraint(equalTo: addPixKeyButton.heightAnchor),
            transferPixButton.topAnchor.constraint(equalTo: addPixKeyButton.topAnchor),
            transferPixButton.trailingAnchor.constraint(equalTo: addPixKeyButton.leadingAnchor, constant: -10),
            
            copyPastePixButton.widthAnchor.constraint(equalTo: addPixKeyButton.widthAnchor),
            copyPastePixButton.heightAnchor.constraint(equalTo: addPixKeyButton.heightAnchor),
            copyPastePixButton.topAnchor.constraint(equalTo: addPixKeyButton.topAnchor),
            copyPastePixButton.leadingAnchor.constraint(equalTo: addPixKeyButton.trailingAnchor, constant: 10),
            
            yourKeysLabel.topAnchor.constraint(equalTo: transferPixButton.bottomAnchor, constant: 20),
            yourKeysLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor)
        ])
    }
    
    //MARK: - button perform
    @objc func performGoToRegisterPix(){
        viewModel?.goToRegisterPix()
    }
}
