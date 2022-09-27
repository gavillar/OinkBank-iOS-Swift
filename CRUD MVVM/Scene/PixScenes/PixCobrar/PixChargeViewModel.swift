//
//  cobrarViewModel.swift
//  CRUD MVVM
//
//  Created by user220270 on 5/27/22.
//

import Foundation

class PixChargeViewModel {
  
    public func generateCopyPaste(value: String, clientCPF: String) -> String{
        let arrayValueChanged = value.components(separatedBy: "R$")
        
        let valueChanged = arrayValueChanged[1].replacingOccurrences(of: ",", with: "_").components(separatedBy: .whitespaces).filter({ !$0.isEmpty }).joined(separator: "")
        
        var timeStampText: String {
            return "\(NSDate().timeIntervalSince1970 * 1000)"
        }
        
        let copyPasteKey = "bankapp.com//\(clientCPF)//\(timeStampText)//\(valueChanged)"
        
        valueFromCopyPasteKey = Double(value) ?? 0.0
        cpfFromCopyPasteKey = clientCPF
        
        return copyPasteKey
    }
    
    //MARK: - verify value and cpf from copypastePix
    static var copyPasteKey = "bankapp.com//43340068833//1653653554564//9999_99"
    
}
