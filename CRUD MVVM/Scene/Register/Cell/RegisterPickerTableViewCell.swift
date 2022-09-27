//
//  RegisterPickerTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/5/22.
//

import Foundation
import UIKit

final class RegisterPickerTableViewCell: UITableViewCell {
    private weak var viewModel: RegisterViewModel?
    
    private lazy var pickerOptions: [String] = ["Entre R$1000 e R$2000", "Entre de R$2000 e R$3000", "Entre R$3000 e R$5000", "Entre R$5000 e R$10000", "Acima de R$10000"]
    // MARK: - cellID
    static let reuseId: String = "RegisterPickerTableViewCell"
    
    // MARK: = UI elements
    //titlelabel
    private lazy var titleLabel: UILabel = {
       let view = UILabel()
        view.font = UIFont.MyTheme.defaultText
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //textfield
    lazy var registerTextField: UITextField = {
       let view = UITextField()
        view.textAlignment = .left
        view.placeholder = "R$"
        view.inputView = Picker
        view.inputAccessoryView = toolBar
        view.layer.cornerRadius = 5
        view.isSecureTextEntry = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.rightView = accessoryAlertImageView
        view.rightViewMode = .always
        
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
    
    // MARK: - alert elements
    lazy var accessoryAlertImageView: UIImageView = {
        //added on registertextfield
        let view = UIImageView()
        view.tintColor = .MyTheme.deleteTextColor
        let image = UIImage(named: "registerTextFieldAlertImage")
        //let image = UIImage(systemName: "key")
        view.image = image
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var tipLabel: UILabel = {
        let view = UILabel()
        view.text = "Aqui está sua dica"
        view.font = .MyTheme.tipText
        view.textColor = .MyTheme.deleteTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    // MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setupconstraints
        setupConstraints()
        
        contentView.backgroundColor = .systemBackground
    }
    
    //init unavailable, fatal error will not occur
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setupView(viewModel: RegisterViewModel, title: String, placeholder: String, keyboardType: UIKeyboardType) {
        self.viewModel = viewModel
        titleLabel.text = title
        registerTextField.placeholder = placeholder
    }
    
    // MARK: - Contraints and subviews
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(registerTextField)
        inputView?.addSubview(toolBar)
        contentView.addSubview(tipLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            titleLabel.widthAnchor.constraint(equalToConstant: 110),
            titleLabel.bottomAnchor.constraint(equalTo: registerTextField.topAnchor, constant: 5),
            
            registerTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            registerTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            registerTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            registerTextField.heightAnchor.constraint(equalToConstant: 30),
            
            tipLabel.widthAnchor.constraint(equalTo: registerTextField.widthAnchor),
            tipLabel.centerXAnchor.constraint(equalTo: registerTextField.centerXAnchor),
            tipLabel.topAnchor.constraint(equalTo: registerTextField.bottomAnchor)
        ])
    }
    
    //MARK: - Perform
    @objc private func performDone() {
        self.registerTextField.endEditing(true)
    }
}

//MARK: - PickerView Delegate/DataSource
extension RegisterPickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        let chooseOption: String = pickerOptions[row]
        viewModel?.newClientMonthlyIncome = chooseOption
        registerTextField.text = chooseOption
    }
}
