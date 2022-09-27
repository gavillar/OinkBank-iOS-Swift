//
//  ShowDataViewController.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import UIKit

class ShowDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UISearchBarDelegate {
    let viewModel: ShowDataViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Visualizar cadastros"
        view.backgroundColor = .white
        
        setupTableView()
    } 
    
    // MARK: - setup TableView
    let tableView = UITableView(frame: .zero, style: .plain)
    
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
        
        tableView.register(ShowDataTableViewCell.self, forCellReuseIdentifier:ShowDataTableViewCell.reuseId)
        
        tableView.reloadData()
    }
    
    // MARK: - View Lifecycle
    init(viewModel: ShowDataViewModel = ShowDataViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TableView Functions
extension ShowDataViewController {
    // MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ShowDataHeaderView()
        
        //search bar
        header.searchBar.delegate = self
    
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        ShowDataHeaderView.height
    }
    
    // MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clients.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    //MARK: - select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.changeIndex(newIndex: indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let editDataViewModel = EditDataViewModel(reloadDelegate: self)
        let editDataViewController = EditDataViewController(viewModel: editDataViewModel)
        self.present(editDataViewController, animated: true)
        //self.navigationController?.pushViewController(editDataViewController, animated: true)
    }
    
    // MARK: - Cell, SetupCell, TextfieldData
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowDataTableViewCell.reuseId, for: indexPath) as? ShowDataTableViewCell else {
            return UITableViewCell()
        }
        
        
        let info = clients[indexPath.row]
        cell.setupView(nameLabelTitle: info.name, cpfLabelTitle: info.cpf)
        return cell
    }
}


extension ShowDataViewController: ShowDataViewModelDelegate {
    func onSuccessReloadData() {
        tableView.reloadData()
    }
}

extension ShowDataViewController: ShowDataViewModelReloadDelegate {
    func updateAllRegister() {
        tableView.reloadData()
    }
}
