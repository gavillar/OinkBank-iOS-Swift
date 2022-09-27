//
//  ShowDataViewModel.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
//MARK: Delegate/Protocols
protocol ShowDataViewModelDelegate: AnyObject {
    //Necessary to display alert/reloadData on View Controller
    func onSuccessReloadData()
}
//reload delegate
protocol ShowDataViewModelReloadDelegate: AnyObject {
    //definition on EditDataViewModel
    func updateAllRegister()
}

protocol ShowDataViewModeling {
    var delegate: ShowDataViewModelDelegate? { get set }
    
    func reloadData()
}

final class ShowDataViewModel{
    weak var delegate: ShowDataViewModelDelegate?
    
    func changeIndex(newIndex: Int) {
        editIndex = newIndex
    }
}

//MARK: - RegisterViewModeling Extension
extension ShowDataViewModel: ShowDataViewModeling {
    func reloadData() {
        delegate?.onSuccessReloadData()
    }
}
