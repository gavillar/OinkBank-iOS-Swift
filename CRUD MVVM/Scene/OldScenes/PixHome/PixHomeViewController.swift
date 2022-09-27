//
//  PixHomeViewController.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 19/05/22.
//

import UIKit

class PixHomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel: PixHomeViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Área Pix"
        view.backgroundColor = .systemBackground
        
        viewModel.verifyPix()
        setupTableView()
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
        
        tableView.register(PixHomeTableViewCell.self, forCellReuseIdentifier: PixHomeTableViewCell.reuseId)
        
        tableView.reloadData()
    }
    
    // MARK: - view lifecycle
    
    init(viewModel: PixHomeViewModel = PixHomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - tableview functions
extension PixHomeViewController {
    //MARK: - rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PixHomeTableViewCell", for: indexPath) as? PixHomeTableViewCell else { return UITableViewCell() }
        
        let info = viewModel.optionKeyInformation
        
        cell.setupView(imageName: info[indexPath.row].imageTitle, keyType: info[indexPath.row].keyTitle, keyText: info[indexPath.row].keyText)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.optionKeyInformation.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        editPixIndex = indexPath.row
        
        viewModel.goToPixDetail()
    }
    
    //MARK: - header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = PixHomeHeaderView()
        header.viewModel = viewModel
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        PixHomeHeaderView.height
    }
}

//MARK: - delgate
extension PixHomeViewController: PixHomeViewModelDelegate {
    func pushToRegisterPix() {
//        let registerPixKeyViewModel = RegisterPixKeyViewModel(reloadDelegate: self)
//        let registerPixKeyViewController = RegisterPixKeyViewController(viewModel: registerPixKeyViewModel)
//        self.present(registerPixKeyViewController, animated: true)
    }
    
    func pushToPixDetail() {
        //present controller that needs reloadDelegate
//        let pixKeyDetailViewModel = PixKeyDetailViewModel(reloadDelegate: self)
//        let pixKeyDetailViewController = PixKeyDetailViewController(viewModel: pixKeyDetailViewModel)
//        self.present(pixKeyDetailViewController, animated: true)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension PixHomeViewController: PixHomeViewModelReloadDelegate {
    func updateAllKeys() {
        viewModel.verifyPix()
        tableView.reloadData()
    }
    
    
}
