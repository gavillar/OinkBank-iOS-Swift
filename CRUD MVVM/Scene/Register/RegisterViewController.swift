//
//  RegisterViewController.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import UIKit

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // view model's type, declaration on init
    let viewModel: RegisterViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Criar Conta"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        setupTableView()
    }
    
    // MARK: - setup TableView
    let tableView = UITableView(frame: .zero, style: .grouped)
    private func setupTableView(){
        //table view
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.reuseId)
        tableView.register(RegisterDatePickerTableViewCell.self, forCellReuseIdentifier: RegisterDatePickerTableViewCell.reuseId)
        tableView.register(RegisterPickerTableViewCell.self, forCellReuseIdentifier: RegisterPickerTableViewCell.reuseId)
        
        tableView.reloadData()
    }
    
    // MARK: - View Lifecycle
    init(viewModel: RegisterViewModel = RegisterViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - TableView Functions
extension RegisterViewController {
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = RegisterHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        RegisterHeaderView.height
    }
    
    // MARK: - Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = RegisterFooterView()
        footer.viewModel = viewModel
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        RegisterFooterView.height
    }
    
    // MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.registerInformation.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        78
    }
    
    // MARK: - Cell, SetupCell, TextfieldData
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterDatePickerTableViewCell.reuseId, for: indexPath) as? RegisterDatePickerTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.registerTextField.tag = indexPath.row
            cell.registerTextField.delegate = self
            let info = viewModel.registerInformation[indexPath.row]
            cell.setupView(viewModel: viewModel ,title: info.title, placeholder: info.placeholder, keyboardType: info.keyboardType)
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterPickerTableViewCell.reuseId, for: indexPath) as? RegisterPickerTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.registerTextField.tag = indexPath.row
            cell.registerTextField.delegate = self
            let info = viewModel.registerInformation[indexPath.row]
            cell.setupView(viewModel: self.viewModel, title: info.title, placeholder: info.placeholder, keyboardType: info.keyboardType)
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.reuseId, for: indexPath) as? RegisterTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.registerTextField.tag = indexPath.row
            cell.registerTextField.delegate = self
            let info = viewModel.registerInformation[indexPath.row]
            cell.setupView(title: info.title, placeholder: info.placeholder, keyboardType: info.keyboardType, isSecure: info.isSecure)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - Textfield delegate
extension RegisterViewController:  UITextFieldDelegate{
    //MARK: - textfield DidChangeSelection/did begin editing
    func textFieldDidChangeSelection(_ textField: UITextField) {
        additionalCellTextFieldSetup(textField)
    }
    func textFieldDidBeginEditing(_ textField: UITextField){
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
        additionalCellTextFieldSetup(textField)
    }
    
    //MARK: - TextFieldDidEndEditing verifications
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexPath = IndexPath(row: textField.tag, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as? RegisterTableViewCell
        
        switch textField.tag{
        // name
        case 0:
             let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: textField.text ?? "")
            
            if verify == false {
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
        //cpf
        case 1:
            if textField.text == "" {
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
                break
            }
            
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: textField.text ?? "")
            
            if verify == false {
                cell?.tipLabel.text = "CPF inválido ou já registrado"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
        //date
        case 2:
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: viewModel.newClientBirthDate)
            
            if verify == false {
                let cell = tableView.cellForRow(at: indexPath) as? RegisterDatePickerTableViewCell
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                let cell = tableView.cellForRow(at: indexPath) as? RegisterDatePickerTableViewCell
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
        //email
        case 3:
            if textField.text == "" {
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
                break
            }
            
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: textField.text ?? "")
            
            if verify == false {
                cell?.tipLabel.text = "E-mail inválido"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
            //monthlyIncome
        case 4:
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: viewModel.newClientMonthlyIncome)
                
            if verify == false {
                let cell = tableView.cellForRow(at: indexPath) as? RegisterPickerTableViewCell
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                let cell = tableView.cellForRow(at: indexPath) as? RegisterPickerTableViewCell
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
        //netWorth
        case 5:
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: textField.text ?? "")
            
            if verify == false {
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
        //password
        case 6:
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: textField.text ?? "")
            
            if verify == false {
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
        //confirmPassword
        case 7:
            if textField.text != viewModel.newClientPassword {
                cell?.tipLabel.text = "Senhas não correspondem"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
                break
            }
            
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: textField.text ?? "")
            
            if verify == false {
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                cell?.tipLabel.isHidden = true
                cell?.accessoryAlertImageView.isHidden = true
            }
        default:
            print("")
        }
    }
    
    //MARK: - Enum textfields
    enum textFieldData: Int{
        case nameTextField
        case cpfTextField
        case birthDateTextField
        case emailTextField
        case monthlyIncomeTextField
        case netWorthTextField
        case passwordTextField
        case confirmPasswordTextField
    }
    
    //MARK: - ValueChanged
    @objc func valueChanged(_ textField: UITextField){
        switch textField.tag{
        case textFieldData.nameTextField.rawValue:
            viewModel.newClientName = textField.text ?? ""
            
        case textFieldData.cpfTextField.rawValue:
            viewModel.newClientCpf = textField.text ?? ""
            
        case textFieldData.birthDateTextField.rawValue:
            viewModel.newClientBirthDate = textField.text ?? ""
            
        case textFieldData.emailTextField.rawValue:
            viewModel.newClientEmail = textField.text ?? ""
            
        case textFieldData.monthlyIncomeTextField.rawValue:
            viewModel.newClientMonthlyIncome = textField.text ?? ""
            
        case textFieldData.netWorthTextField.rawValue:
            viewModel.newClientNetWorth = textField.text ?? ""
            
        case textFieldData.passwordTextField.rawValue:
            viewModel.newClientPassword = textField.text ?? ""
            
        case textFieldData.confirmPasswordTextField.rawValue:
            viewModel.newClientCOnfirmPassword = textField.text ?? ""
            
        default:
            break
        }
    }
    
    //MARK: - Additional textfield setup
    func additionalCellTextFieldSetup(_ textField: UITextField?) {
        switch textField?.tag{
        case textFieldData.cpfTextField.rawValue:
            textField?.text = textField?.text?.formatMask(mask: "###.###.###-##")
        case textFieldData.netWorthTextField.rawValue:
            textField?.text = textField?.text?.currencyInputFormatting()
        default:
            break
        }
    }
}

//MARK: = Delegate protocol
extension RegisterViewController: RegisterViewModelDelegate {
    func onSuccessPushView() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    func performSucess(){
        let registerSucess = RegisterSucessViewController()
        self.navigationController?.pushViewController(registerSucess, animated: true)
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func displayAlertWithAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in self.onSuccessPushView()}))
        present(alert, animated: true)
    }
    
    func onSuccessPopView() {
        self.navigationController?.popViewController(animated: true)
    }
}
