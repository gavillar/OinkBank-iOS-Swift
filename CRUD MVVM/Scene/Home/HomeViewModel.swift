//
//  HomeViewModel.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import Foundation
//MARK: - protocol
protocol HomeViewModelDelegate: AnyObject {
    func reloadData()
    func onLogOutPoptoRoot()
    
    func onClickPushToPix()
}

protocol HomeViewModeling {
    var delegate: HomeViewModelDelegate? { get set }
    func reloadData()
    func popToRoot()
    
    func pushToPix()
}

struct OptionData{
    let imageTile: String
    let optionTitle: String
}

//MARK: - Class
final class HomeViewModel {
    // MARK: - init
    var optionInformation: [OptionData] = [
           .init(imageTile: "ic_cartao", optionTitle: "Meus Cartões"),
           .init(imageTile: "ic_emprestimo", optionTitle: "Empréstimos"),
           .init(imageTile: "ic_celular", optionTitle: "Recarga de Celular"),
           .init(imageTile: "ic_fourshopping", optionTitle: "BankShopping"),
           .init(imageTile: "ic_seguro", optionTitle: "Seguro"),
           .init(imageTile: "ic_editar_dados", optionTitle: "Editar Dados"),
           .init(imageTile: "ic_sair", optionTitle: "Sair")
       ]

    
    weak var delegate: HomeViewModelDelegate?
    //var coreDataService = CoreDataService()
    //var coreDataPìxService = CoreDataPixService()
    
    var hide: Bool = false
    
    //MARK: - header elements text
    //let greetingsText = "Olá, \(clients[loginIndex].name)"
    //let balanceText = "R$\(String(format: "%.2f", clients[loginIndex].balance))"
    //let accountText = "Conta: \(String(clients[loginIndex].account))"
    
    //MARK: - hideBalance func
    func hideBalanceToggle() {
        hide.toggle()
    }
    
    //MARK: - logout
    func logOut(){
        
    }
    
    //MARK: - fetchdata
    func fetchData(){
        //coreDataService.fetchData()
    }
    
    func fetchPixData(){
        //coreDataPìxService.fetchData()
    }
    
    //MARK: - Gotopix
    func goToPix(){
        
    }
}

extension HomeViewModel: HomeViewModeling {
    func pushToPix() {
        self.delegate?.onClickPushToPix()
    }
    
    func popToRoot() {
        self.delegate?.onLogOutPoptoRoot()
    }
    
    func reloadData() {
        delegate?.reloadData()
    }
}
