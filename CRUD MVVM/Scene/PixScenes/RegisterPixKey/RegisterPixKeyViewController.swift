//
//  RegisterPixKeyViewController.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/20/22.
//

import UIKit
import CloudKit


class RegisterPixKeyViewController: UIViewController {
    let viewModel: RegisterPixKeyViewModel?
    
    

     lazy var pickerOptions: [String] = ["CPF", "Chave Aleatória", "Telefone", "E-mail"]
    
    override func viewDidAppear(_ animated: Bool) {
        if editPixIndex == 0{
            selectOptionTextField.text = "CPF"
            viewModel?.optionSelected = "CPF"
            yourKeyTextField.text = viewModel?.verifySelection()
            
        }
        
        if editPixIndex == 1{
            selectOptionTextField.text = "Chave Aleatória"
            viewModel?.optionSelected = "Chave Aleatória"
            yourKeyTextField.text = viewModel?.verifySelection()
            
        }
        
        if editPixIndex == 2{
            selectOptionTextField.text = "Telefone"
            viewModel?.optionSelected = "Telefone"
            yourKeyTextField.text = viewModel?.verifySelection()
            
            yourKeyDescriptionLabel.text = viewModel?.phoneOptionSelectedLabelName()
            
           
            yourKeyTextField.tag = 1
            
            yourKeyTextField.placeholder = viewModel?.phoneOptionSelectedPlaceholder()
            yourKeyTextField.isUserInteractionEnabled = true
            
        }
        
        if editPixIndex == 3{
            selectOptionTextField.text = "E-mail"
            viewModel?.optionSelected = "E-mail"
            yourKeyTextField.text = viewModel?.verifySelection()
            
            yourKeyDescriptionLabel.text = viewModel?.phoneOptionSelectedLabelName()
            
            yourKeyTextField.tag = 2
            
            yourKeyTextField.placeholder = viewModel?.phoneOptionSelectedPlaceholder()
            yourKeyTextField.isUserInteractionEnabled = true
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
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
        view.text = "Cadastrar uma chave PIX"
        view.font = .MyTheme.boldTitleText
        view.numberOfLines = -1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var keyTypeDescriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Selecione o tipo de chave desejada:"
        view.font = .MyTheme.defaultText
        view.numberOfLines = -1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var yourKeyDescriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Sua Chave:"
        view.font = .MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: - Teste
     lazy var yourKeyTextField: UITextField = {
        let view = NoPasteTextField()
        view.text = ""
        view.tag = 1
        view.delegate = self
        view.keyboardType = .numberPad
        view.borderStyle = .roundedRect
        view.isUserInteractionEnabled = false
         view.textColor = .MyTheme.mainBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //RegisterKey button
    private lazy var registerPixKeyButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = .MyTheme.mainBlueColor
        view.setTitle("Cadastrar", for: .normal)
        view.setTitleColor(UIColor.MyTheme.backgroundColor, for: .normal)
        view.titleLabel?.font = .MyTheme.defaultText
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(tapRegisterButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    @objc func tapRegisterButton() {
        
        let verify = viewModel?.verifyBlankTextField(text: yourKeyTextField.text  ?? "")
        let verifyNumber = viewModel?.verifyCellPhoneAndEmail(text: yourKeyTextField.text ?? "")
        
        if verify == true && verifyNumber == true{
            
            let alert = UIAlertController(title: "Chave cadastrada", message: "",preferredStyle: .alert)
            let registerAlert = UIAlertAction(title: "Ok", style: .default){ (action)in  self.dismiss(animated: true)}
            alert.addAction(registerAlert)
            self.present(alert,animated: true)
            
            viewModel?.cellPhonePixKey = yourKeyTextField.text ?? ""
            viewModel?.emailPixKey = yourKeyTextField.text ?? ""
            viewModel?.registerPixKey()
            
        }
        
    }
        
    //MARK: - PickerView
     lazy var selectOptionTextField: UITextField = {
        let view = UITextField()
         view.textAlignment = .center
         view.textColor = .MyTheme.mainBlueColor
         view.text = "Selecionar"
         view.backgroundColor = .MyTheme.mainGreenButtonColor
         view.inputView = Picker
         view.inputAccessoryView = toolBar
         view.layer.cornerRadius = 5
         view.isSecureTextEntry = false
         view.isUserInteractionEnabled = false
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    private lazy var toolBar: UIToolbar = {
        let view = UIToolbar()
        view.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(performDone))
        view.setItems([doneButton], animated: true)
        return view
    }()
    
    private lazy var Picker: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = .clear
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - init
    init(viewModel: RegisterPixKeyViewModel = RegisterPixKeyViewModel()){
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        self.viewModel?.delegate = self
        
        
        
        
        setupView()
        setupLayoutConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupview
    func setupView() {
        view.addSubview(descriptionLabel)
        view.addSubview(keyTypeDescriptionLabel)
        view.addSubview(yourKeyDescriptionLabel)
        view.addSubview(yourKeyTextField)
        view.addSubview(registerPixKeyButton)
        
        view.addSubview(selectOptionTextField)
        inputView?.addSubview(toolBar)
    }
    
    //MARK: - setuplayoutconstraints
    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            keyTypeDescriptionLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            keyTypeDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            keyTypeDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            yourKeyDescriptionLabel.topAnchor.constraint(equalTo: keyTypeDescriptionLabel.bottomAnchor, constant: 10),
            yourKeyDescriptionLabel.leadingAnchor.constraint(equalTo: keyTypeDescriptionLabel.leadingAnchor),
            yourKeyDescriptionLabel.widthAnchor.constraint(equalTo: keyTypeDescriptionLabel.widthAnchor),
            
            yourKeyTextField.centerYAnchor.constraint(equalTo: yourKeyDescriptionLabel.centerYAnchor),
            yourKeyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            yourKeyTextField.leadingAnchor.constraint(equalTo: yourKeyDescriptionLabel.trailingAnchor),
            
            registerPixKeyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerPixKeyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            registerPixKeyButton.topAnchor.constraint(equalTo: yourKeyTextField.bottomAnchor, constant: 20),
            
            //textfield with pickerview
            selectOptionTextField.centerYAnchor.constraint(equalTo: keyTypeDescriptionLabel.centerYAnchor),
            selectOptionTextField.leadingAnchor.constraint(equalTo: yourKeyDescriptionLabel.trailingAnchor),
            selectOptionTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    //MARK: - Button Perform
    @objc private func performDone() {
        
        yourKeyDescriptionLabel.text = viewModel?.phoneOptionSelectedLabelName()
        
        if yourKeyDescriptionLabel.text == "Insira seu email:" {
            yourKeyTextField.tag = 2
        }
        else {
            yourKeyTextField.tag = 1
        }
        yourKeyTextField.placeholder = viewModel?.phoneOptionSelectedPlaceholder()
        yourKeyTextField.text = viewModel?.verifySelection()
        self.selectOptionTextField.endEditing(true)
        
    }
}

//MARK: - pickerview Delegate/DataSource
extension RegisterPixKeyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 || row == 3{
            
            yourKeyTextField.isUserInteractionEnabled = true
            let chooseOption: String = pickerOptions[row]
            selectOptionTextField.text = chooseOption
            viewModel?.optionSelected = chooseOption
            
        }
        else{
            
        yourKeyTextField.isUserInteractionEnabled = false
        let chooseOption: String = pickerOptions[row]
        selectOptionTextField.text = chooseOption
        viewModel?.optionSelected = chooseOption
        
            
        }
    }
}

//MARK: - protocol
extension RegisterPixKeyViewController: RegisterPixKeyViewModelDelegate {
    func onSuccessDismiss() {
        
       
        
    }
    
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
        
    }
    
    
}







