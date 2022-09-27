//
//  HomePixViewController.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/24/22.
//

import UIKit

class HomePixViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pix"

        // Do any additional setup after loading the view.
    }
    
    //MARK: - UI Elements
    //MARK: Description label
    private lazy var descriptionLabel: UILabel = {
       let view = UILabel()
        view.text = "Abaixo, selecione uma funcionalidade:"
        view.font = .MyTheme.defaultText
        view.numberOfLines = -1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: phone button
    private lazy var phoneButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_celular")
        view.setImage(image, for: .normal)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var phoneLabel: UILabel = {
       let view = UILabel()
        view.font = .MyTheme.myKeysText
        view.text = "Celular"
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: QRCode button
    private lazy var qrCodeButton: UIButton = {
        let view = UIButton(frame: .zero)
        let image = UIImage(named: "ic_qrcode")
        view.setImage(image, for: .normal)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var qrCodeLabel: UILabel = {
       let view = UILabel()
        view.font = .MyTheme.myKeysText
        view.text = "QR Code"
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Email button
    private lazy var emailButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_email")
        view.setImage(image, for: .normal)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
       let view = UILabel()
        view.font = .MyTheme.myKeysText
        view.text = "E-mail"
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: CPF button
    private lazy var cpfButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_cpf")
        view.setImage(image, for: .normal)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cpfLabel: UILabel = {
       let view = UILabel()
        view.font = .MyTheme.myKeysText
        view.text = "CPF/CNPJ"
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - second row buttons
    //MARK: random key button
    private lazy var randomKeyButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_key")
        view.setImage(image, for: .normal)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var randomKeyLabel: UILabel = {
       let view = UILabel()
        //view.textColor = .systemGray5
        view.font = .MyTheme.myKeysText
        view.text = "Chave Aleatória"
        view.numberOfLines = -1
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: copy paste button
    private lazy var copyPasteButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_copiaecola")
        view.setImage(image, for: .normal)
        view.addTarget(self, action: #selector(performGoToCopyAndPaste), for: .touchUpInside)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var copyPasteLabel: UILabel = {
       let view = UILabel()
        view.font = .MyTheme.myKeysText
        view.text = "Pix Copia e Cola"
        view.numberOfLines = -1
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: transfer button
    private lazy var transferButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_transferir")
        view.setImage(image, for: .normal)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var transferLabel: UILabel = {
       let view = UILabel()
        view.font = .MyTheme.myKeysText
        view.text = "Transferir"
        view.numberOfLines = -1
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: charge button
    private lazy var chargeButton: UIButton = {
       let view = UIButton()
        let image = UIImage(named: "ic_receber")
        view.setImage(image, for: .normal)
        view.layer.cornerRadius = 20
        view.tintColor = UIColor.MyTheme.blackColor
        view.backgroundColor = .MyTheme.mainGreenButtonColor
        view.addTarget(self, action: #selector(performGoToCharge), for: .touchUpInside)
        view.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var chargeLabel: UILabel = {
       let view = UILabel()
        view.font = .MyTheme.myKeysText
        view.text = "Receber"
        view.numberOfLines = -1
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - MyKeys button
    private lazy var myKeysButton: UIButton = {
       let view = UIButton()
        view.tintColor = .MyTheme.mainGreenButtonColor
        view.setTitleColor(UIColor.MyTheme.blackColor, for: .normal)
        view.setTitle("Minhas Chaves Pix", for: .normal)
        view.titleLabel?.font = .MyTheme.defaultText
        view.backgroundColor = .tintColor
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(performGoToMyKeys), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var myKeysImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .MyTheme.whiteTextColor
        let image = UIImage(named: "ic_key")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topButtonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [qrCodeButton, phoneButton, emailButton, cpfButton])
        view.alignment = .center
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var bottomButtonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [randomKeyButton, copyPasteButton, transferButton, chargeButton])
        view.alignment = .center
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    //MARK: - Init
    init(){
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupLayoutConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView
    private func setupView(){
        view.backgroundColor = .systemBackground
        view.addSubview(descriptionLabel)
        view.addSubview(phoneButton)
        view.addSubview(phoneLabel)
        view.addSubview(qrCodeButton)
        view.addSubview(qrCodeLabel)
        view.addSubview(emailButton)
        view.addSubview(emailLabel)
        view.addSubview(cpfButton)
        view.addSubview(cpfLabel)
        view.addSubview(topButtonStackView)
        //second row
        view.addSubview(randomKeyButton)
        view.addSubview(randomKeyLabel)
        view.addSubview(copyPasteButton)
        view.addSubview(copyPasteLabel)
        view.addSubview(transferLabel)
        view.addSubview(transferButton)
        view.addSubview(chargeButton)
        view.addSubview(chargeLabel)
        view.addSubview(myKeysButton)
        view.addSubview(myKeysImageView)
        view.addSubview(bottomButtonStackView)
    }
    
    //MARK: - SetupConstraints
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            
        descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        
        topButtonStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
        topButtonStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        topButtonStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        
         
         //every button uses phone button as reference
        phoneButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.17),
        phoneButton.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.17),
         
         phoneLabel.topAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 5),
         phoneLabel.centerXAnchor.constraint(equalTo: phoneButton.centerXAnchor),
         
         qrCodeButton.widthAnchor.constraint(equalTo: phoneButton.widthAnchor),
         qrCodeButton.heightAnchor.constraint(equalTo: phoneButton.heightAnchor),
         
         qrCodeLabel.topAnchor.constraint(equalTo: phoneLabel.topAnchor),
         qrCodeLabel.centerXAnchor.constraint(equalTo: qrCodeButton.centerXAnchor),
         
         emailButton.widthAnchor.constraint(equalTo: phoneButton.widthAnchor),
         emailButton.heightAnchor.constraint(equalTo: phoneButton.heightAnchor),
         
         emailLabel.topAnchor.constraint(equalTo: phoneLabel.topAnchor),
         emailLabel.centerXAnchor.constraint(equalTo: emailButton.centerXAnchor),
         
         cpfButton.widthAnchor.constraint(equalTo: phoneButton.widthAnchor),
         cpfButton.heightAnchor.constraint(equalTo: phoneButton.heightAnchor),
         
         cpfLabel.topAnchor.constraint(equalTo: phoneLabel.topAnchor),
         cpfLabel.centerXAnchor.constraint(equalTo: cpfButton.centerXAnchor),
         
         //second row
        
        bottomButtonStackView.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 16),
        bottomButtonStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        bottomButtonStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        
         randomKeyButton.widthAnchor.constraint(equalTo: phoneButton.widthAnchor),
         randomKeyButton.heightAnchor.constraint(equalTo: phoneButton.heightAnchor),
         
         randomKeyLabel.centerXAnchor.constraint(equalTo: randomKeyButton.centerXAnchor),
         randomKeyLabel.topAnchor.constraint(equalTo: randomKeyButton.bottomAnchor, constant: 5),
         randomKeyLabel.widthAnchor.constraint(equalTo: randomKeyButton.widthAnchor),
         
         copyPasteButton.widthAnchor.constraint(equalTo: phoneButton.widthAnchor),
         copyPasteButton.heightAnchor.constraint(equalTo: phoneButton.heightAnchor),
         
         copyPasteLabel.centerXAnchor.constraint(equalTo: copyPasteButton.centerXAnchor),
         copyPasteLabel.topAnchor.constraint(equalTo: copyPasteButton.bottomAnchor, constant: 5),
         copyPasteLabel.widthAnchor.constraint(equalTo: copyPasteButton.widthAnchor),
         
         transferButton.widthAnchor.constraint(equalTo: phoneButton.widthAnchor),
         transferButton.heightAnchor.constraint(equalTo: phoneButton.heightAnchor),
         
         transferLabel.centerXAnchor.constraint(equalTo: transferButton.centerXAnchor),
         transferLabel.topAnchor.constraint(equalTo: transferButton.bottomAnchor, constant: 5),
         
         chargeButton.widthAnchor.constraint(equalTo: phoneButton.widthAnchor),
         chargeButton.heightAnchor.constraint(equalTo: phoneButton.heightAnchor),
         
         chargeLabel.centerXAnchor.constraint(equalTo: chargeButton.centerXAnchor),
         chargeLabel.topAnchor.constraint(equalTo: chargeButton.bottomAnchor, constant: 5),
         
         myKeysButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         myKeysButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
         myKeysButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
         myKeysButton.topAnchor.constraint(equalTo: randomKeyLabel.bottomAnchor, constant: 20),
         
         myKeysImageView.heightAnchor.constraint(equalTo: myKeysButton.heightAnchor, multiplier: 0.55),
         myKeysImageView.widthAnchor.constraint(equalTo: myKeysImageView.heightAnchor),
         myKeysImageView.centerYAnchor.constraint(equalTo: myKeysButton.centerYAnchor),
         myKeysImageView.leadingAnchor.constraint(equalTo: myKeysButton.leadingAnchor, constant: 10)
        ])
    }
    
    //MARK: - Button perform
    @objc func performGoToMyKeys() {
        let myKeysViewController = MyKeysViewController()
        self.navigationController?.pushViewController(myKeysViewController, animated: true)
    }
    @objc func performGoToCharge() {
        let cobrarViewController = ChargeViewController()
        self.navigationController?.pushViewController(cobrarViewController, animated: true)
    }
    @objc func performGoToCopyAndPaste() {
        let copyAndPastView = CopyAndPastViewController()
        self.navigationController?.pushViewController(copyAndPastView, animated: true)
    }
}
