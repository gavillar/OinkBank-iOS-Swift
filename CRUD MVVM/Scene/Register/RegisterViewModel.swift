//
//  RegisterViewModel.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit
import CoreData

//MARK: - Protocols
protocol RegisterViewModelDelegate: AnyObject {
    //Necessary to display alert/reloadData on View Controller
    func displayAlert(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func onSuccessPopView()
    
    func onSuccessPushView()
    func performSucess()
}

protocol RegisterViewModeling {
    var delegate: RegisterViewModelDelegate? { get set }
    
    func displayAlert(title: String, message: String)
    func displayAlertWithAction(title: String, message: String)
    func popViewController()
    
    func pushToHome()
}

//MARK: - Struct, Class
struct RegisterData {
    let title: String
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
}

final class RegisterViewModel {
    //private let service = CoreDataService()
    //private let servicePix = CoreDataPixService()
    
    weak var delegate: RegisterViewModelDelegate?
    
    // MARK: - Register INIT
    lazy var registerInformation: [RegisterData] = [
        .init(title: "Nome", placeholder: "Ex.: João da Silva"),
        .init(title: "CPF", placeholder: "Ex.: 000.000.000-00", keyboardType: .numberPad),
        .init(title: "Data de Nascimento", placeholder: "Ex.: 01/01/2000"),
        .init(title: "E-mail", placeholder: "Ex.: joao.silva@email.com"),
        .init(title: "Renda Mensal", placeholder: "Ex.: 999,99", keyboardType: .numberPad),
        .init(title: "Patrimônio Liquido", placeholder: "Ex.: 999,99", keyboardType: .numberPad),
        .init(title: "Senha", placeholder: "Ex.: ******", keyboardType: .numberPad, isSecure: true),
        .init(title: "Confirmar Senha", placeholder: "Ex.: ******", keyboardType: .numberPad, isSecure: true),
    ]
    
    // MARK: - New Client attributes and Add Functions
    var newClientName = ""
    var newClientCpf = ""
    var newClientBirthDate = ""
    var newClientEmail = ""
    var newClientMonthlyIncome = ""
    var newClientNetWorth = ""
    var newClientBalance = 0.0
    var newClientPassword = ""
    var newClientCOnfirmPassword = ""
    var newClientAccount = clients.count+1
    var newClientVerifyDigit = 0
    
    func addNewClient(){
        newClientVerifyDigit = verifyDigit(account: String(newClientAccount))
        
        let newClient = Client(name: newClientName, cpf: newClientCpf, birthDate: newClientBirthDate, email: newClientEmail, monthlyIncome: newClientMonthlyIncome, netWorth: newClientNetWorth, password: newClientPassword, balance: newClientBalance, account: newClientAccount, verifyDigit: newClientVerifyDigit)
        let newClientPix = Pix(account: newClientAccount, agency: "1-9", cpfKey: "S/ Cadastro", randomKey: "S/ Cadastro", phoneKey: "S/ Cadastro", copyPastePix: "", emailKey: "S/ Cadastro")
        
        let verify = verifyTf()
        let verifyEmail = verifyEmail(email: newClient.email)
        let verifyPassword = verifyPassword(password: newClientPassword, confirmPassword: newClientCOnfirmPassword)
        let verifyCpf = verifyCpf(cpf: newClientCpf)
        
        // for tests below
        //let verify = true
        //let verifyEmail = true
        
        if verify == true && verifyEmail == true && verifyCpf == true && verifyPassword == true{
            clients.append(newClient)
            //service.addClient(newClient: newClient)
            
            allPix.append(newClientPix)
            //servicePix.addClientPix(newClientPix: newClientPix)
            
            //displayAlertWithAction(title: "Sucsso", message: "Cadastro concluído!")
            //popViewController()
            
            autoLogin()
            print(newClient)
        }
    }
    
    // MARK: - Register Verify
    func verifyTf() -> Bool {
        let valuesTyped: [String] = [newClientName, newClientCpf, newClientEmail, newClientBirthDate, String(newClientMonthlyIncome), newClientNetWorth]
        
        for i in 0...valuesTyped.count-1{
            print("indice: \(i), valor: \(valuesTyped[i])")
            if valuesTyped[i] == "" || valuesTyped[i]  == "0.0"{
                self.delegate?.displayAlert(title: "Erro", message: "Preencha todos os Campos")
                return false
            }
        }
        return true
    }
    
    func autoLogin(){
        for i in 0...clients.count-1 {
            if clients[i].cpf == newClientCpf{
                loginIndex = i
                performregisterSucess()
            }
        }
    }
    
    func verifyCpf(cpf: String) -> Bool {
        let cpfVerify = cpf.isValidCPF
        
        for i in 0...clients.count-1{
            if newClientCpf == clients[i].cpf {
                //self.delegate?.displayAlert(title: "Erro", message: "CPF já cadastrado")
                return false
            }
        }
        
        if cpfVerify == true {
            return true
        } else {
            //self.delegate?.displayAlert(title: "Erro", message: "CPF Inválido")
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
            //self.delegate?.displayAlert(title: "Erro", message: "E-mail Inválido")
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
            self.delegate?.displayAlert(title: "Erro", message: "Idade Inválida, a idade mínima é 18 anos e a máxima 120 anos")
            newClientBirthDate = ""
            //return false
        } else {
            //return true
        }
    }
    
    func verifyPassword(password: String, confirmPassword: String) -> Bool{
        if password != confirmPassword {
            self.delegate?.displayAlert(title: "Erro", message: "Senhas não correspondem")
            return false
        } else {
            return true
        }
    }
    
    //MARK: - VerifyDigits
    private func verifyDigit(account: String) -> Int{
        // cut string in parts, add to array and reverse array
        var digits = account.compactMap{ $0.wholeNumberValue }
        digits.reverse()
        
        var totalSum: Int = 0
        
        for i in 0...digits.count-1{
            totalSum = totalSum + (digits[i] * (i+2))
        }
        
        let digitReturn = (totalSum * 10) % 11
        
        return digitReturn
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



//MARK: - RegisterViewModelin Extension
extension RegisterViewModel: RegisterViewModeling {
    func pushToHome() {
        self.delegate?.onSuccessPushView()
    }
    
    func popViewController() {
        self.delegate?.onSuccessPopView()
    }
    func performregisterSucess(){
        self.delegate?.performSucess()
    }
    
    
    func displayAlert(title: String, message: String) {
        delegate?.displayAlert(title: title, message: message)
    }
    
    func displayAlertWithAction(title: String, message: String) {
        delegate?.displayAlertWithAction(title: title, message: message)
    }
}
