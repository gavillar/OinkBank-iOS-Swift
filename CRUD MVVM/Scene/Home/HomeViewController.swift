//
//  HomeViewController.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel: HomeViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        
        setupTableView()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //REMOVE LATER
        viewModel.fetchData()
        viewModel.fetchPixData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - setup TableView
    let tableView = UITableView(frame: .zero, style: .grouped)
    private func setupTableView(){
        //table view
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseId)
        
        tableView.reloadData()
    }
    
    // MARK: - View Lifecycle
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - tableviewFunctions
extension HomeViewController{
    //MARK: - header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HomeHeaderView.height
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HomeHeaderView()
        header.viewModel = viewModel
        
        let greetingsText = "Olá, \(clients[loginIndex].name)"
        let balanceText = "R$\(String(format: "%.2f", clients[loginIndex].balance).replacingOccurrences(of: ".", with: ","))"
        let accountText = "Conta: \(String(clients[loginIndex].account))-\(String(clients[loginIndex].verifyDigit))"
        
        header.setupView(greetingsText: greetingsText, balanceText: balanceText, accountText: accountText)
        return header
    }
    
    //MARK: - rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.optionInformation.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let info = viewModel.optionInformation[indexPath.row]
        cell.setupView(imageTitle: info.imageTile, optionTitle: info.optionTitle)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.row){
        case 5:
            //edit data
            editIndex = loginIndex
            let editDataViewModel = EditDataViewModel(reloadDelegate: self)
            let editDataViewController = EditDataViewController(viewModel: editDataViewModel)
            self.navigationController?.pushViewController(editDataViewController, animated: true)
            //self.present(editDataViewController, animated: true)
            
        case 6:
            viewModel.popToRoot()
            
        default:
            print(indexPath.row)
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func onClickPushToPix() {
        let pixHomeViewController = HomePixViewController()
        self.navigationController?.pushViewController(pixHomeViewController, animated: true)
    }
    
    func onLogOutPoptoRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension HomeViewController: ShowDataViewModelReloadDelegate{
    func updateAllRegister() {
        tableView.reloadData()
    }
    
    
}
