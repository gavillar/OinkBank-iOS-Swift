//
//  MyKeysViewController.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/24/22.
//

import UIKit

class MyKeysViewController: UIViewController {
    let viewModel: MyKeysViewModel
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Minhas chaves PIX"
        view.backgroundColor = .systemBackground
        
        viewModel.verifyPix()
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
        
        tableView.register(MyKeysTableViewCell.self, forCellReuseIdentifier: MyKeysTableViewCell.reuseId)
        
        tableView.reloadData()
    }
    
    // MARK: - view lifecycle
    init(viewModel: MyKeysViewModel = MyKeysViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: tableViewFunctions
extension MyKeysViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.optionKeyInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyKeysTableViewCell", for: indexPath) as? MyKeysTableViewCell else { return UITableViewCell() }
        
        let info = viewModel.optionKeyInformation
        
        cell.setupView(imageName: info[indexPath.row].imageTitle, keyType: info[indexPath.row].keyTitle, keyText: info[indexPath.row].keyText)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        editPixIndex = indexPath.row
        
        viewModel.verifyPixKeys()
        viewModel.goToPixDetail()
    }
    
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MyKeysHeaderView()
        header.viewModel = self.viewModel
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        MyKeysHeaderView.Height
    }
}

extension MyKeysViewController: MyKeysViewModelDelegate {
    func pushToRegisterPix() {
        //present controller that needs reloadDelegate
        let registerPixKeyViewModel = RegisterPixKeyViewModel(reloadDelegate: self)
        let registerPixKeyViewController = RegisterPixKeyViewController(viewModel: registerPixKeyViewModel)
        self.present(registerPixKeyViewController, animated: true)
    }
    
    func pushToPixDetail() {
        //present controller that needs reloadDelegate
        let pixKeyDetailViewModel = PixKeyDetailViewModel(reloadDelegate: self)
        let pixKeyDetailViewController = PixKeyDetailViewController(viewModel: pixKeyDetailViewModel)
        self.present(pixKeyDetailViewController, animated: true)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension MyKeysViewController: MyKeysViewModelReloadDelegate {
    func updateAllKeys() {
        viewModel.verifyPix()
        tableView.reloadData()
    }
}
