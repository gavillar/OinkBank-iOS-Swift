//
//  PixKeyDetailViewController.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 19/05/22.
//

import UIKit

class PixKeyDetailViewController: UIViewController {
    let viewModel: PixKeyDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detalhes da chave PIX"

        // Do any additional setup after loading the view.
        // Present modaly in botton
        if let presentationController = presentationController as? UISheetPresentationController {
                presentationController.detents = [
                    .medium(),
                    .large()
                ]
            }
        
        view.backgroundColor = .systemBackground
    }
    

    //MARK: - UIElements
    private lazy var descriptionLabel: UILabel = {
       let view = UILabel()
        view.text = "Visualizar sua chave PIX"
        view.font = .MyTheme.boldTitleText
        view.numberOfLines = -1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //key type
    private lazy var keyTypeDescriptionLabel: UILabel = {
       let view = UILabel()
        view.text = "Tipo de chave:"
        view.font = .MyTheme.defaultBoldText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var keyTypeLabel: UILabel = {
       let view = UILabel()
        view.text = "Chave Aleatória(teste)"
        view.font = .MyTheme.defaultBoldText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //key
    private lazy var yourKeyDescriptionLabel: UILabel = {
       let view = UILabel()
        view.text = "Sua chave:"
        view.font = .MyTheme.defaultBoldText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var yourKeyLabel: UILabel = {
       let view = UILabel()
        view.text = "chave chave"
        view.font = .MyTheme.defaultBoldText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - deleteKey button
    private lazy var deleteKeyButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = .MyTheme.mainBlueColor
        view.setTitleColor(UIColor.MyTheme.backgroundColor, for: .normal)
        view.setTitle("Excluir chave", for: .normal)
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(performDelete), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Lifecycle
    init(viewModel: PixKeyDetailViewModel = PixKeyDetailViewModel()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
        self.viewModel?.delegate = self
        
        viewModel.verifyPixKey()
        aditionalSetup()
        setupView()
        setupLayoutConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView
    func setupView(){
        view.addSubview(descriptionLabel)
        view.addSubview(keyTypeDescriptionLabel)
        view.addSubview(keyTypeLabel)
        view.addSubview(yourKeyDescriptionLabel)
        view.addSubview(yourKeyLabel)
        view.addSubview(deleteKeyButton)
    }
    
    //MARK: - aditionalSetup
    func aditionalSetup(){
        keyTypeLabel.text = viewModel?.pixKeyType
        yourKeyLabel.text = viewModel?.pixKey
    }
    
    //MARK: - SetupLayoutConstraints
    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            keyTypeDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            keyTypeDescriptionLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            keyTypeDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            keyTypeLabel.topAnchor.constraint(equalTo: keyTypeDescriptionLabel.topAnchor),
            keyTypeLabel.leadingAnchor.constraint(equalTo: keyTypeDescriptionLabel.trailingAnchor),
            
            yourKeyDescriptionLabel.leadingAnchor.constraint(equalTo: keyTypeDescriptionLabel.leadingAnchor),
            yourKeyDescriptionLabel.topAnchor.constraint(equalTo: keyTypeLabel.bottomAnchor, constant: 10),
            yourKeyDescriptionLabel.widthAnchor.constraint(equalTo: keyTypeDescriptionLabel.widthAnchor),
            
            yourKeyLabel.leadingAnchor.constraint(equalTo: keyTypeLabel.leadingAnchor),
            yourKeyLabel.topAnchor.constraint(equalTo: yourKeyDescriptionLabel.topAnchor),
            
            deleteKeyButton.topAnchor.constraint(equalTo: yourKeyLabel.bottomAnchor, constant: 20),
            deleteKeyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteKeyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    
    //MARK: - Button perform
    @objc func performDelete() {
        viewModel?.deleteKey()
    }

}

//MARK: - delegate protocol
extension PixKeyDetailViewController: PixKeyDetailViewModelDelegate {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func onSuccessDismiss() {
        self.dismiss(animated: true)
    }
    
    
}
