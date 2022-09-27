//
//  PixCopyAndPastViewModel.swift
//  CRUD MVVM
//
//  Created by user220212 on 6/1/22.
//

import Foundation
import UIKit

protocol PixCopyAndPasteViewModelDelegate: AnyObject {
    
    func displayAlert(message: String, title: String, handler: UIAlertAction?)
    
}

protocol PixCopyAndPastViewModeling {
    var delegate: PixCopyAndPasteViewModelDelegate? { get set }
    func displayAlert(message: String, title: String, handler: UIAlertAction?)
}

final class PixCopyAndPasteViewModel {
    weak var delegate: PixCopyAndPasteViewModelDelegate?
    
    //MARK: - verify value and cpf from copypastePix
    static var copyPasteKey = "bankapp.com//43340068833//1653653554564//9999_99"
    
    public func verifyValuesFromCopyPastePix(copyPastePix: String) {
        let copyPasteArray = copyPastePix.components(separatedBy: "//")
        
        //verify if it's in a valid format
        let isValidCopyPaste = isValidCopyPastePix(copyPasteArray: copyPasteArray)
        
        if isValidCopyPaste == true {
            valueFromCopyPasteKey = Double(copyPasteArray[3].replacingOccurrences(of: "_", with: ".").replacingOccurrences(of: " ", with: "0")) ?? 0.0
            cpfFromCopyPasteKey = copyPasteArray[1]
        }
        else {
            print("colocar alerta de copypaste invalidooo")
            
            displayAlert(message: "Chave inválida", title: "ERRO", handler: nil)
        }
    }
    
    //verify if the format of copypastepix is correct -> 4 elements separated by "//"
    private func isValidCopyPastePix (copyPasteArray: [String]) -> Bool{
        if copyPasteArray.count != 4 {
            return false
        }
        return true
    }
    
    public func verifyName() -> String {
        for i in 0...clients.count-1 {
            if clients[i].cpf == cpfFromCopyPasteKey {
                return clients[i].name
            }
        }
        return ""
    }
    
    public func verifyCpf() -> Bool {
        if clients[loginIndex].cpf == cpfFromCopyPasteKey {
            return false
        }
        
        return true
    }
    
    public func transferValue() -> Bool{
        let verifyCpf = self.verifyCpf()
        let verifyBalance = self.verifyBalance(value: String(valueFromCopyPasteKey))
        let verifyDestination = self.verifyDestination()
        
        if verifyCpf == true && verifyBalance == true && verifyDestination == true{
            let valueToTransfer = Double(valueFromCopyPasteKey)
            clients[loginIndex].balance = clients[loginIndex].balance - (valueToTransfer)
            print(clients[loginIndex].balance)
            for i in 0...clients.count-1 {
                if clients[i].cpf == cpfFromCopyPasteKey {
                    clients[i].balance = clients[i].balance + (valueToTransfer)
                    print(clients[i].balance)
                    displayAlert(message: "Transferência concluída", title: "SUCESSO", handler: nil)
                }
            }
            return true
            
        } else {
//            displayAlert(message: "Verifique se seu saldo é suficiente ou se não está tentando fazer a transferência para a mesma conta.", title: "Algo deu errado", handler: nil)
            return false
        }
    }
    
    private func verifyDestination() -> Bool {
        for i in 0...clients.count-1 {
            if cpfFromCopyPasteKey == clients[i].cpf {
                return true
            }
        }
        return false
    }
    
    public func verifyBalance(value: String) -> Bool {
        let newValue = Double(value)
        guard let newValue = newValue else { return false }
        if newValue > clients[loginIndex].balance {
            return false
        }
        return true
    }
}

extension PixCopyAndPasteViewModel: PixCopyAndPastViewModeling {
    func displayAlert(message: String, title: String, handler: UIAlertAction?) {
        delegate?.displayAlert(message: message, title: title, handler: handler)
    }
    
}
