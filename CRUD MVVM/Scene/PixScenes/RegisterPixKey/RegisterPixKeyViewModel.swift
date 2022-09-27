//
//  RegisterPixKeyViewModel.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/20/22.
//

import Foundation


protocol RegisterPixKeyViewModelDelegate: AnyObject {
    
    func onSuccessDismiss()
    
    func displayAlert(title: String, message: String)
    
}

protocol RegisterPixKeyViewModeling {
    var delegate: RegisterPixKeyViewModelDelegate? { get set }
    var reloadDelegate: MyKeysViewModelReloadDelegate? { get }
}

final class RegisterPixKeyViewModel {
    weak var delegate: RegisterPixKeyViewModelDelegate?
    weak var reloadDelegate: MyKeysViewModelReloadDelegate?
    
    init(reloadDelegate: MyKeysViewModelReloadDelegate? = nil){
        self.reloadDelegate = reloadDelegate
    }
    
    var selectedOption: String = "Selecionar"
    
    var optionSelected: String = ""
    var randomStringKey: String = ""
    var cellPhonePixKey: String = ""
    var emailPixKey: String = ""
    
    func verifySelection() -> String{
        
        var selectedCpf: String
        var selectedRandomKey: String
        var selectedPhoneKey: String
        var selectedEmailKey: String
        
        if optionSelected == "CPF"{
            
            selectedCpf = clients[loginIndex].cpf
            
            
            return selectedCpf
            
           
        }else if optionSelected == "Chave Aleatória"{
            
            randomStringKey = randomString(length: 32)
            
            selectedRandomKey = randomStringKey
            
            
            return selectedRandomKey
            
            
        }else if optionSelected == "Telefone"{
        
            selectedPhoneKey = cellPhonePixKey
            
                
            return selectedPhoneKey
                
        }else if optionSelected == "E-mail"{
            
            selectedEmailKey = emailPixKey
            
                
            return selectedEmailKey
                
            }
            
            return ""

        
    }
    
    
    func phoneOptionSelectedLabelName() -> String{
        
        let registerpixcontroller = RegisterPixKeyViewController()
        var changedLabel: String
        
        let select = optionSelected
        
        if select == "CPF" && select == "Chave Aleatória"{
            
            registerpixcontroller.yourKeyDescriptionLabel.text = "Sua Chave:"
            changedLabel = registerpixcontroller.yourKeyDescriptionLabel.text!
            
            return changedLabel
            
        }
        
        if select == "Telefone"{
            
            registerpixcontroller.yourKeyDescriptionLabel.text = "Insira seu celular:"
            changedLabel = registerpixcontroller.yourKeyDescriptionLabel.text!
            
            return changedLabel
        }
        
        if select == "E-mail"{
            
            registerpixcontroller.yourKeyDescriptionLabel.text = "Insira seu email:"
            changedLabel = registerpixcontroller.yourKeyDescriptionLabel.text!
            
            return changedLabel
        }
        
        return ""
        
    }
    
    func phoneOptionSelectedPlaceholder() -> String{
        
        let registerpixcontroller = RegisterPixKeyViewController()
        var changedLabel: String
        
        let select = optionSelected
        
        if select == "Telefone"{
            
            registerpixcontroller.yourKeyTextField.placeholder = "(99)99999-9999"
            changedLabel = registerpixcontroller.yourKeyTextField.placeholder!
            return changedLabel
        }
        if select == "E-mail"{
            
            registerpixcontroller.yourKeyTextField.placeholder = "email@gmail.com"
            changedLabel = registerpixcontroller.yourKeyTextField.placeholder!
            return changedLabel
        }
        
        return ""
        
    }
    
    
    func registerPixKey(){
        
    
        let select = optionSelected
        
        
        if select == "CPF"{
            
            allPix[loginIndex].cpfKey = clients[loginIndex].cpf
            
            reloadDelegate?.updateAllKeys()
            dismissView()
            
            //return true
            
        }
        
        if select == "Chave Aleatória"{
            
            allPix[loginIndex].randomKey = randomStringKey
            
            
            reloadDelegate?.updateAllKeys()
            dismissView()
            
            //return true
            
        }
        
         if select == "Telefone"{
             
             allPix[loginIndex].phoneKey = cellPhonePixKey
             
             print(cellPhonePixKey)
             
             reloadDelegate?.updateAllKeys()
             dismissView()
             
             //return true
            
        }
        
        if select == "E-mail"{
            
            allPix[loginIndex].emailKey = emailPixKey
            
            print(emailPixKey)
            
            reloadDelegate?.updateAllKeys()
            dismissView()
            
            //return true
           
       }
        
        //return false
        
        }
    
    func verifyCellPhoneAndEmail(text: String) -> Bool{
        
        let select = optionSelected
        
        if select == "Telefone"{
            
            if text.count != 14{
            
                displayAlert(title: "Erro", message: "Número de telefone inválido")
                return false
                
            }
        }
        if select == "E-mail"{
            
            return verifyEmail(text: text)
        }
        
        return true
       
        
    }
    
    func verifyEmail(text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let validate = emailPred.evaluate(with: text)
        
        if validate == true {
            return true
        } else {
            self.delegate?.displayAlert(title: "Erro", message: "E-mail Inválido")
            return false
        }
    }
    
    
    func verifyBlankTextField(text: String) -> Bool{
        
        if text == "" || text == "Chave Teste"{
            
            displayAlert(title: "Erro", message: "Por favor verifique todos os campos")
            
            return false
            
        
        }
        
        return true
        
    }
    
    
    
    
        
    func randomString(length: Int) -> String {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
    return String((0..<length).map{ _ in letters.randomElement()! })
        
        
    }
    
        
    }
    


extension RegisterPixKeyViewModel: RegisterPixKeyViewModeling {
    
    func displayAlert(title: String, message: String) {
        self.delegate?.displayAlert(title: title, message: message)
    }
    
    func dismissView() {
        self.delegate?.onSuccessDismiss()
    }
    
    func reloadUpdateAllPixKeys() {
        self.reloadDelegate?.updateAllKeys()
    }
    
}
