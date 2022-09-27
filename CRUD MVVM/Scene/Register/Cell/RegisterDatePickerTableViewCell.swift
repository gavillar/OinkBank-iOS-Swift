//
//  RegisterDatePickerTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/5/22.
//

import Foundation
import UIKit

final class RegisterDatePickerTableViewCell: UITableViewCell {
    private weak var viewModel: RegisterViewModel?
    // MARK: - cellID
    static let reuseId: String = "RegisterDatePickerTableViewCell"
    
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
        
        let secondstoYears: Double = 567648000 + 345600
        let confirmAge = Date(timeIntervalSinceNow: -secondstoYears)
        datePicker.maximumDate = confirmAge
        
        let view = NoPasteTextField()
        view.textAlignment = .left
        view.font = UIFont.MyTheme.defaultText
        view.inputView = datePicker
        view.inputAccessoryView = toolBar
        view.layer.cornerRadius = 5
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
    
    private lazy var datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.backgroundColor = .clear
        view.datePickerMode = .date
//        view.tintColor = UIColor.MyTheme.mainBlueColor
        view.preferredDatePickerStyle = .wheels
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
        
        contentView.backgroundColor = .MyTheme.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setupView(viewModel: RegisterViewModel, title: String, placeholder: String, keyboardType: UIKeyboardType){
        self.viewModel = viewModel
        titleLabel.text = title
        registerTextField.placeholder = placeholder
        registerTextField.keyboardType = keyboardType
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
            titleLabel.bottomAnchor.constraint(equalTo: registerTextField.topAnchor, constant: 5),
            
            registerTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            registerTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            
            tipLabel.widthAnchor.constraint(equalTo: registerTextField.widthAnchor),
            tipLabel.centerXAnchor.constraint(equalTo: registerTextField.centerXAnchor),
            tipLabel.topAnchor.constraint(equalTo: registerTextField.bottomAnchor)
        ])
    }
    
    //MARK: - Perform
    @objc private func performDone() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: datePicker.date)
        
        
        viewModel?.newClientBirthDate = dateString
        self.registerTextField.text = dateString
        viewModel?.verifyDate(date: datePicker.date)
        self.registerTextField.endEditing(true)
    }
}
