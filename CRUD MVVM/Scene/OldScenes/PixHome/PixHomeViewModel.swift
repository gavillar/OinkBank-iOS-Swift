//
//  PixHomeViewModel.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 19/05/22.
//

import Foundation

//MARK: - protocols
protocol PixHomeViewModelDelegate: AnyObject {
    func reloadData()
    func pushToPixDetail()
    
    func pushToRegisterPix()
}

protocol PixHomeViewModelReloadDelegate: AnyObject {
    func updateAllKeys()
}

protocol PixHomeViewModeling {
    var delegate: PixHomeViewModelDelegate? { get set }
    
    func reloadData()
    func pushToPixDetail()
    
    func pushToRegisterPix()
}

////MARK: - optionData
//struct OptionKeyData {
//    let imageTitle: String
//    let keyTitle: String
//    var keyText: String
//}

//MARK: - class
final class PixHomeViewModel {
    weak var delegate: PixHomeViewModelDelegate?
    
    var optionKeyInformation: [OptionKeyData] = [
        OptionKeyData(imageTitle: "person.crop.square.filled.and.at.rectangle", keyTitle: "CPF", keyText: "S/ Cadastro"),
        OptionKeyData(imageTitle: "person.badge.key", keyTitle: "Chave Aleatória", keyText: "S/ Cadastro"),
        OptionKeyData(imageTitle: "iphone", keyTitle: "Telefone", keyText: "S/ Cadastro")
    ]
    
    //MARK: - verifyPix
    func verifyPix(){
        //verify each pix key
        if allPix[loginIndex].cpfKey != "" {
            optionKeyInformation[0].keyText = allPix[loginIndex].cpfKey
        }
        
        if allPix[loginIndex].randomKey != "" {
            optionKeyInformation[1].keyText = allPix[loginIndex].randomKey
        }
        
        if allPix[loginIndex].phoneKey != "" {
            optionKeyInformation[2].keyText = allPix[loginIndex].phoneKey
        }
    }
    
    //MARK: - Navigation functions
    func goToPixDetail(){
        pushToPixDetail()
    }
    
    func goToRegisterPix(){
        pushToRegisterPix()
    }
    
}

//MARK: - extension protocol
extension PixHomeViewModel: PixHomeViewModeling {
    func pushToRegisterPix() {
        self.delegate?.pushToRegisterPix()
    }
    
    func pushToPixDetail() {
        self.delegate?.pushToPixDetail()
    }
    
    func reloadData() {
        self.delegate?.reloadData()
    }
    
}
