//
//  EditDataTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/3/22.
//

import Foundation
import UIKit

final class EditDataPickerTableViewCell: UITableViewCell {
    private weak var viewModel: EditDataViewModel?
    
    private lazy var pickerOptions: [String] = ["Entre R$1000 e R$2000", "Entre de R$2000 e R$3000", "Entre R$3000 e R$5000", "Entre R$5000 e R$10000", "Acima de R$10000"]
    
    //MARK: - cellId
    static let reuseId: String = "EditDataPickerTableViewCell"
    
    //MARK: - UIElements
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var editTextField: UITextField = {
        let view = UITextField()
        view.textAlignment = .left
        view.text = "Selecionar"
        view.inputView = Picker
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
    
    //MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //constraints
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(viewModel: EditDataViewModel, titleLableText: String, editTextFieldText: String){
        self.viewModel = viewModel
        titleLabel.text = titleLableText
        editTextField.text = editTextFieldText
    }
    
    func setupConstraints(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(editTextField)
        contentView.addSubview(tipLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: editTextField.topAnchor),
            
            editTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            editTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            editTextField.bottomAnchor.constraint(equalTo: tipLabel.topAnchor),
            
            tipLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            tipLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            tipLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    //MARK: - Perform
    @objc private func performDone() {
        self.editTextField.endEditing(true)
    }
}

extension EditDataPickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        viewModel?.editClientMonthlyIncome = chooseOption
        editTextField.text = chooseOption
    }
}
