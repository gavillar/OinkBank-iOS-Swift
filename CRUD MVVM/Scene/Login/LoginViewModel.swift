//
//  LoginViewModel.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func displayAlert(title: String, message: String)
    func onSuccessPush()
}

protocol LoginViewModeling {
    var delegate: LoginViewModelDelegate? { get set }
    
    func displayAlert(title: String, message: String)
    func pushViewController()
}

//MARK: - Class
final class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    
    //MARK: - Login var
    var loginAgency = ""
    var loginAccount = ""
    var loginPassword = ""
    
    //MARK: - Login func
    func doLogin(){
        let verifyTf = verifyTF()
        let verifyLogin = verifyLogin()
        
        if verifyLogin == true && verifyTf == true {
            pushViewController()
        } else {
            displayAlert(title: "Erro", message: "Login Inválido")
        }
    }
    
    //MARK: verify functions
    func verifyLogin() -> Bool{
        for i in 0...clients.count-1{
            if clients[i].agency == loginAgency && clients[i].password == loginPassword && "\(String(clients[i].account))-\(String(clients[i].verifyDigit))" == loginAccount{
                loginIndex = i
                return true
            }
        }
        return false
    }
    func verifyTF() -> Bool{
        if loginAgency == "" || loginAccount == "" || loginPassword == ""{
            displayAlert(title: "Erro", message: "Preencha todos os campos")
            return false
        }else{
            return true
        }
    }
}

//MARK: Extension
extension LoginViewModel: LoginViewModeling {
    
    func displayAlert(title: String, message: String) {
        delegate?.displayAlert(title: title, message: message)
    }
    
    func pushViewController() {
        delegate?.onSuccessPush()
    }
    
}
