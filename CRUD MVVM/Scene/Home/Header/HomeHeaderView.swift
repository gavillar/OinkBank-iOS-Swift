//
//  HomeHeaderView.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import UIKit

class HomeHeaderView: UIView {
    weak var viewModel: HomeViewModel?
    
    static let height: CGFloat = 305
    
    //MARK: - UIElements
    //MARK: - greetings, icon
    private lazy var greetingsLabel: UILabel = {
       let view = UILabel()
        view.text = "Olá TESTE"
        view.font = UIFont.MyTheme.boldTitleText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
       let view = UIImageView()
        view.tintColor = .MyTheme.mainBlueColor
        view.image = UIImage(named: "ic_profile")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Card
    private lazy var cardImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.MyTheme.mainBlueColor
        view.layer.cornerRadius = 7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var balanceTitleLabel: UILabel = {
       let view = UILabel()
        view.text = "Saldo:"
        view.font = UIFont.MyTheme.homeHeaderText
        view.textColor = UIColor.MyTheme.defaultTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var balanceAmountLabel: UILabel = {
         let view = UILabel()
         view.text = "R$999,99"
        view.font = UIFont.MyTheme.homeHeaderText
         view.textColor = UIColor.MyTheme.defaultTextColor
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    private lazy var hideBalanceButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_eye_visibility")
        view.tintColor = UIColor.MyTheme.defaultTextColor
        view.setImage(image, for: .normal)
        view.addTarget(self, action: #selector(performHideBalance), for: .touchUpInside)
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Fast Action Buttons
    private lazy var payBillsButton: UIButton = {
        let view = UIButton()
        view.semanticContentAttribute = .forceLeftToRight
        view.contentHorizontalAlignment = .center
        let image = UIImage(named: "ic_barcode")
        view.layer.cornerRadius = 5
        view.setImage(image, for: .normal)
        view.setTitle("Pagar", for: .normal)
        view.titleLabel?.font = UIFont.MyTheme.defaultText
        view.backgroundColor = UIColor.MyTheme.mainGreenButtonColor
        view.tintColor = UIColor.MyTheme.blackColor
        view.setTitleColor(UIColor.MyTheme.blackColor, for: .normal)
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    private lazy var pixButton: UIButton = {
        let view = UIButton()
        view.semanticContentAttribute = .forceLeftToRight
        view.contentHorizontalAlignment = .center
        let image = UIImage(named: "ic_pix")
        view.layer.cornerRadius = 5
        view.setImage(image, for: .normal)
        view.setTitle("Pix", for: .normal)
        view.titleLabel?.font = UIFont.MyTheme.defaultText
        view.backgroundColor = UIColor.MyTheme.mainGreenButtonColor
        view.tintColor = UIColor.MyTheme.blackColor
        view.setTitleColor(UIColor.MyTheme.blackColor, for: .normal)
        view.addTarget(self, action: #selector(performPix), for: .touchUpInside)
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    private lazy var transferButton: UIButton = {
        let view = UIButton()
        view.semanticContentAttribute = .forceLeftToRight
        view.contentHorizontalAlignment = .left
        let image = UIImage(named: "ic_transferir")
        view.layer.cornerRadius = 5
        view.setImage(image, for: .normal)
        view.setTitle("Transferir", for: .normal)
        view.titleLabel?.font = UIFont.MyTheme.defaultText
        view.backgroundColor = UIColor.MyTheme.mainGreenButtonColor
        view.tintColor = UIColor.MyTheme.blackColor
        view.setTitleColor(UIColor.MyTheme.blackColor, for: .normal)
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(performLogOut), for: .touchUpInside)
         return view
    }()
    
    //MARK: Agency and account
    private lazy var agencyLabel: UILabel = {
        let view = UILabel()
        view.text = "Agência: 1-9"
        view.textColor = UIColor.MyTheme.defaultTextColor
        view.font = UIFont.MyTheme.homeHeaderText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountLabel: UILabel = {
        let view = UILabel()
        view.text = "Conta: 00000-0"
        view.textColor = UIColor.MyTheme.defaultTextColor
        view.font = UIFont.MyTheme.homeHeaderText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - INIT
    init(){
        super.init(frame: .zero)
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupVIew
    func setupView(greetingsText: String, balanceText: String, accountText: String){
        greetingsLabel.text = greetingsText
        balanceAmountLabel.text = balanceText
        accountLabel.text = accountText
        self.backgroundColor = .MyTheme.backgroundColor
    }
    
    func addSubView() {
        self.backgroundColor = .systemBackground
        self.addSubview(greetingsLabel)
        self.addSubview(iconImageView)
        self.addSubview(cardImageView)
        self.addSubview(balanceTitleLabel)
        self.addSubview(balanceAmountLabel)
        self.addSubview(hideBalanceButton)
        
        self.addSubview(pixButton)
        self.addSubview(payBillsButton)
        self.addSubview(transferButton)
        
        self.addSubview(agencyLabel)
        self.addSubview(accountLabel)
    }
    
    //MARK: - SetupConstraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            greetingsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            iconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            iconImageView.centerYAnchor.constraint(equalTo: greetingsLabel.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalTo: greetingsLabel.heightAnchor),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            
            cardImageView.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 10),
            cardImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            cardImageView.heightAnchor.constraint(equalTo: cardImageView.widthAnchor, multiplier: 0.5),
            
            //card details
            balanceTitleLabel.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 10),
            balanceTitleLabel.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: 10),
            
            balanceAmountLabel.centerYAnchor.constraint(equalTo: cardImageView.centerYAnchor),
            balanceAmountLabel.leadingAnchor.constraint(equalTo: balanceTitleLabel.leadingAnchor, constant: 10),
            
            hideBalanceButton.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 10),
            hideBalanceButton.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: -10),
            
                                                                                        
            payBillsButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.29),
            payBillsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            payBillsButton.heightAnchor.constraint(equalToConstant: 50),
            payBillsButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 10),
            
            pixButton.widthAnchor.constraint(equalTo: payBillsButton.widthAnchor),
            pixButton.centerYAnchor.constraint(equalTo: payBillsButton.centerYAnchor),
            pixButton.heightAnchor.constraint(equalTo: payBillsButton.heightAnchor),
            pixButton.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor),
            
            transferButton.widthAnchor.constraint(equalTo: payBillsButton.widthAnchor),
            transferButton.centerYAnchor.constraint(equalTo: payBillsButton.centerYAnchor),
            transferButton.heightAnchor.constraint(equalTo: payBillsButton.heightAnchor),
            transferButton.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor),
            
            agencyLabel.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: -10),
            agencyLabel.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: 10),
            
            accountLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            accountLabel.bottomAnchor.constraint(equalTo: agencyLabel.bottomAnchor)
        ])
    }
    
    //MARK: - Button Perform
    @objc func performHideBalance(){
        viewModel?.hideBalanceToggle()
        
        if viewModel?.hide == true {
            balanceAmountLabel.text = "R$-----"
            let image = UIImage(named: "ic_eye_visibility_off")
            hideBalanceButton.setImage(image, for: .normal)
        } else {
            viewModel?.reloadData()
        }
    }
    
    @objc func performPix(){
        viewModel?.pushToPix()
    }
    
    @objc func performLogOut(){
        // on transfer button, remove later
        //viewModel?.popToRoot()
    }
}
