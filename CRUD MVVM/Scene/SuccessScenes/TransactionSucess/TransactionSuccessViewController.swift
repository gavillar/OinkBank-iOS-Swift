//
//  TransactionSuccessViewController.swift
//  CRUD MVVM
//
//  Created by user220256 on 6/14/22.
//

import UIKit

class TransactionSuccessViewController: UIViewController {
    
    private lazy var topLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .MyTheme.defaultTextColor
        label.text = "Transação Concluída!"
        label.font = .MyTheme.boldTitleText
        return label
    }()
    
    private lazy var topLabelSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .MyTheme.defaultTextColor
        label.text = "Sua transação foi efetuada com sucesso."
        label.font = .MyTheme.defaultText
        return label
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "TransactionSuccessImage"))
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    


    private lazy var continueButton: UIButton = UIButton.defaultButton(title: "Continuar", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(tappedButton))
        


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addSubviews()
        self.setupConstraints()
        self.additionalSetup()
    }
    
    //MARK: Função botão
    @objc func tappedButton(){
//        let homeVC = HomeViewController()
//        self.navigationController?.popToViewController(homeVC, animated: true)
        //        self.navigationController?.popViewController(animated: true)
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 5], animated: true)
    }
    
    //MARK: Funções de UI (Add e constraints)
    private func additionalSetup(){
        self.view.backgroundColor = .MyTheme.backgroundColor
        self.navigationController?.isNavigationBarHidden = true
    }

    private func addSubviews(){
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(topLabelTitle)
        self.view.addSubview(topLabelSubtitle)
        
        self.view.addSubview(continueButton)
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            

            self.topLabelTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 16),

            self.topLabelTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.topLabelTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            self.topLabelSubtitle.topAnchor.constraint(equalTo: self.topLabelTitle.bottomAnchor),
            self.topLabelSubtitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.topLabelSubtitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            self.backgroundImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            self.continueButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.continueButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.continueButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        
        ])
    }
    

}
