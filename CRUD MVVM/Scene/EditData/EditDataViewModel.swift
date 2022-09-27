//
//  EditDataViewModel.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/3/22.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol EditDataViewModelDelegate: AnyObject {
    //Necessary to display alert/reloadData on View Controller
    func displayAlert(title: String, message: String)
    func displayAlertWithDismissAction(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func onSuccessDismiss()
    
    func pushToIntro()
}

protocol EditDataViewModeling {
    var delegate: EditDataViewModelDelegate? { get set }
    //reloadDelegate
    var reloadDelegate: ShowDataViewModelReloadDelegate? { get }
    
    func displayAlert(title: String, message: String)
    func displayAlertWithDismissAction(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func dismissView()
    func reloadUpdateAllRegister()
    
    func pushToIntro()
}

final class EditDataViewModel {
    //let service = CoreDataService()
    weak var delegate: EditDataViewModelDelegate?
    weak var reloadDelegate: ShowDataViewModelReloadDelegate?
    
    var cellTitle = ["Nome", "CPF", "Data de Nascimento", "E-Mail", "Renda Mensal", "Patrimônio Líquido"]
    
    init(reloadDelegate: ShowDataViewModelReloadDelegate? = nil) {
        self.reloadDelegate = reloadDelegate
    }
    
    func showInfo(row: Int) -> String{
        switch row {
        case 0: editClientName = clients[editIndex].name; return clients[editIndex].name
        case 1: editClientCpf = clients[editIndex].cpf; return clients[editIndex].cpf
        case 2: editClientBirthDate = clients[editIndex].birthDate; return clients[editIndex].birthDate
        case 3: editClientEmail = clients[editIndex].email; return clients[editIndex].email
        case 4: editClientMonthlyIncome = clients[editIndex].monthlyIncome; return clients[editIndex].monthlyIncome
        case 5: editClientNetWorth = clients[editIndex].netWorth; return clients[editIndex].netWorth
            
        default:
            break
        }
        
        return ""
    }
    
    //MARK: - New Client attributes and Add Functions
    var editClientName = ""
    var editClientCpf = ""
    var editClientBirthDate = ""
    var editClientEmail = ""
    var editClientMonthlyIncome = ""
    var editClientNetWorth = ""
    var editClientPassword = clients[editIndex].password
    var editClientBalance = clients[editIndex].balance
    var editClientAccount = clients[editIndex].account
    var editClientVerifyDigit = clients[editIndex].verifyDigit
    
    func updateClient(){
        let updateClient = Client(name: editClientName, cpf: editClientCpf, birthDate: editClientBirthDate, email: editClientEmail, monthlyIncome: editClientMonthlyIncome, netWorth: editClientNetWorth, password: editClientPassword, balance: Double(editClientBalance) , account: editClientAccount, verifyDigit: editClientVerifyDigit)
//        let verify = verifyTf()
        let verifyEmail = verifyEmail(email: updateClient.email)
        print(updateClient.cpf)
        let verifyCpf = verifyCpf(cpf: updateClient.cpf)
        print(updateClient)
        
        if verifyEmail == true && verifyCpf == true{
            clients[editIndex] = updateClient
            //service.updateClient(editClient: updateClient)
            
            reloadUpdateAllRegister()
            displayAlertWithDismissAction(title: "Sucesso", message: "Atualização realizada")
            print(updateClient)
        } else{
            print("else")
        }
    }
    
    // MARK: - Register Verify
    func verifyTf() -> Bool {
        let valuesTyped: [String] = [editClientName, editClientCpf, editClientEmail, editClientBirthDate, String(editClientMonthlyIncome), editClientNetWorth]
        
        for i in 0...valuesTyped.count-1{
            if valuesTyped[i] == "" || valuesTyped[i]  == "0.0"{
                //mudar depois ALERTA
//                self.delegate?.displayAlert(title: "Erro", message: "Preencha todos os Campos")
                return false
            }
        }
        return true
    }
    
    func verifyCpf(cpf: String) -> Bool {
        let cpfVerify = cpf.isValidCPF
        
        if cpf != clients[editIndex].cpf {
//            self.delegate?.displayAlert(title: "Erro", message: "Não é possível editar CPF")
            return false
        }
        
        if cpfVerify == true {
            return true
        } else {
//            self.delegate?.displayAlert(title: "Erro", message: "CPF Inválido")
            return false
        }
    }
    
    func verifyEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let validate = emailPred.evaluate(with: email)
        
        if validate == true {
            return true
        } else {
//            self.delegate?.displayAlert(title: "Erro", message: "E-mail Inválido")
            return false
        }
    }
    
    func verifyDate(date: Date){
        let date = date
        
        let minAge: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
        print(minAge)
        let maxAge: Date = Calendar.current.date(byAdding: .year, value: -120, to: Date())!;
        print(maxAge)
        
        if date >= minAge || date <= maxAge {
//            self.delegate?.displayAlert(title: "Erro", message: "Idade Inválida, a idade mínima é 18 anos e a máxima 120 anos")
            editClientBirthDate = ""
            //return false
        } else {
            //return true
        }
    }
    
    //MARK: - Delete
    func deleteClient(){
        clients.remove(at: editIndex)
        //service.deleteClient()
        //reloadUpdateAllRegister()
        //dismissView()
        pushToIntro()
    }
    
    //MARK: - TextFieldVerifications
    func verifyTextFieldRealTime(index: Int, value: String) -> Bool {
        switch index {
        // name
        case 0:
            if value == "" {
                return false
            }
            else {
                return true
            }
        //cpf
        case 1:
            let verifyCpf = verifyCpf(cpf: value)
            
            if verifyCpf == true {
                return true
            }
            else {
                return false
            }
        // date
        case 2:
            if value == "" || value == "Selecionar"{
                return false
            }
            else {
                return true
            }
        //email
        case 3:
            let verifyEmail = verifyEmail(email: value)
            
            if verifyEmail == true {
                return true
            }
            else {
                return false
            }
        // monthly income
        case 4:
            if value == "" || value == "Selecionar"{
                return false
            }
            else {
                return true
            }
        //netWorth
        case 5:
            if value == "" {
                return false
            }
            else {
                return true
            }
        //password
        case 6:
            if value == "" {
                return false
            }
            else {
                return true
            }
        //confirmPassword
        case 7:
            if value == "" {
                return false
            }
            else {
                return true
            }
        default:
            return false
        }
    }
}

//MARK: - RegisterViewModeling Extension
extension EditDataViewModel: EditDataViewModeling {
    func pushToIntro() {
        self.delegate?.pushToIntro()
    }
    
    
    func dismissView() {
        self.delegate?.onSuccessDismiss()
    }
    
    func reloadUpdateAllRegister() {
        //reload delegate, other viewController
        self.reloadDelegate?.updateAllRegister()
    }
    
    func displayAlert(title: String, message: String) {
        delegate?.displayAlert(title: title, message: message)
    }
    
    func displayAlertWithDismissAction(title: String, message: String) {
        delegate?.displayAlertWithDismissAction(title: title, message: message)
    }
    
    func displayAlertWithAction(title: String, message: String) {
        delegate?.displayAlertWithAction(title: title, message: message)
    }
}
