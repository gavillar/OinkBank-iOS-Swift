//
//  EditDataViewController.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/3/22.
//

import UIKit

class EditDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    let viewModel: EditDataViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Editar Cadastro"

        // Do any additional setup after loading the view.
        // Present modaly in botton
        if let presentationController = presentationController as? UISheetPresentationController {
                presentationController.detents = [
                    .medium(),
                    .large()
                ]
            }
        setupTableView()
    }
    
    //MARK: - TableView
    let tableView = UITableView(frame: .zero, style: .grouped)
    private func setupTableView(){
        
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //cell
        tableView.register(EditDataTableViewCell.self, forCellReuseIdentifier: EditDataTableViewCell.reuseId)
        tableView.register(EditDataDatePickerTableViewCell.self, forCellReuseIdentifier: EditDataDatePickerTableViewCell.reuseId)
        tableView.register(EditDataPickerTableViewCell.self, forCellReuseIdentifier: EditDataPickerTableViewCell.reuseId)
        
        tableView.reloadData()
    }
    
    // MARK: - View Lifecycle
    init(viewModel: EditDataViewModel = EditDataViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TableView Functions
extension EditDataViewController {
    // MARK: - footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = EditDataFooterView()
        footer.viewModel = viewModel
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        EditDataFooterView.height
    }
    
    //MARK: - header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = EditDataHeaderView()
        header.viewModel = viewModel

        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        EditDataHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        78
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EditDataDatePickerTableViewCell.reuseId, for: indexPath) as? EditDataDatePickerTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.editTextField.tag = indexPath.row
            cell.editTextField.delegate = self
            cell.editTextField.isUserInteractionEnabled = false
            
            let cellTitle = viewModel.cellTitle[indexPath.row]
            let textFieldText = viewModel.showInfo(row: indexPath.row)
            cell.setupView(viewModel: viewModel, titleLableText: cellTitle, editTextFieldText: textFieldText)
            return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EditDataPickerTableViewCell.reuseId, for: indexPath) as? EditDataPickerTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.editTextField.tag = indexPath.row
            cell.editTextField.delegate = self
            
            let cellTitle = viewModel.cellTitle[indexPath.row]
            let textFieldText = viewModel.showInfo(row: indexPath.row)
            cell.setupView(viewModel: viewModel, titleLableText: cellTitle, editTextFieldText: textFieldText)
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EditDataTableViewCell.reuseId, for: indexPath) as? EditDataTableViewCell else {
                return UITableViewCell()}
            //textfielddata
            cell.editTextField.tag = indexPath.row
            
            if cell.editTextField.tag == 0 || cell.editTextField.tag == 1 {
                cell.editTextField.isUserInteractionEnabled = false
            }
            else {
                cell.editTextField.isUserInteractionEnabled = true
            }
            
            cell.editTextField.delegate = self
            let cellTitle = viewModel.cellTitle[indexPath.row]
            let textFieldText = viewModel.showInfo(row: indexPath.row)
            cell.setupView(titleLableText: cellTitle, editTextFieldText: textFieldText)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
}

//MARK: - Textfields
extension EditDataViewController {
    //MARK: - TextFieldDidEndEditing verifications
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexPath = IndexPath(row: textField.tag, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as? EditDataTableViewCell
        
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
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: viewModel.editClientBirthDate)
            
            if verify == false {
                let cell = tableView.cellForRow(at: indexPath) as? EditDataDatePickerTableViewCell
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
            let verify = viewModel.verifyTextFieldRealTime(index: textField.tag, value: viewModel.editClientMonthlyIncome)
                
            if verify == false {
                let cell = tableView.cellForRow(at: indexPath) as? EditDataPickerTableViewCell
                cell?.tipLabel.text = "Campo obrigatório"
                cell?.tipLabel.isHidden = false
                cell?.accessoryAlertImageView.isHidden = false
            } else {
                let cell = tableView.cellForRow(at: indexPath) as? EditDataPickerTableViewCell
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
        default:
            print("")
        }
    }
    
    // ENUM
    enum textFieldData: Int{
        case nameTextField
        case cpfTextField
        case birthDateTextField
        case emailTextField
        case monthlyIncomeTextField
        case netWorthTextField
    }
    
    // Value Changed
    @objc func valueChanged(_ textField: UITextField){
        switch textField.tag{
        case textFieldData.nameTextField.rawValue:
            viewModel.editClientName = textField.text ?? ""
            
        case textFieldData.cpfTextField.rawValue:
            viewModel.editClientCpf = textField.text ?? ""
            
        case textFieldData.birthDateTextField.rawValue:
            viewModel.editClientBirthDate = textField.text ?? ""
            
        case textFieldData.emailTextField.rawValue:
            viewModel.editClientEmail = textField.text ?? ""
            
        case textFieldData.monthlyIncomeTextField.rawValue:
            viewModel.editClientMonthlyIncome = textField.text ?? ""
            
        case textFieldData.netWorthTextField.rawValue:
            viewModel.editClientNetWorth = textField.text ?? ""
            
        default:
            break
        }
    }
    
    func createPickerView(sender: UITextField){
        let datePickerView : UIDatePicker = UIDatePicker()

        datePickerView.datePickerMode = UIDatePicker.Mode.date
        sender.inputView = datePickerView
        datePickerView.tag = sender.tag
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(caller:)), for: UIControl.Event.valueChanged)
    }

    @objc func datePickerValueChanged(caller: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none

        let indexRow = 3

        let indexPath = IndexPath(row: indexRow, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! EditDataTableViewCell

        cell.editTextField.text = dateFormatter.string(from: caller.date)
    }
}

extension EditDataViewController: EditDataViewModelDelegate {
    func pushToIntro() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func displayAlertWithAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: {(alert: UIAlertAction!) in self.viewModel.deleteClient()}))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        present(alert, animated: true)
    }
    
    func displayAlertWithDismissAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in self.onSuccessDismiss()}))
        present(alert, animated: true)
    }
    
    func onSuccessDismiss() {
        self.dismiss(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
