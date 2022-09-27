//
//  EditDataFooterView.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/4/22.
//

import UIKit

class EditDataFooterView: UIView {
    weak var viewModel: EditDataViewModel?
    
    static let height: CGFloat = 100
    
    // MARK: - UIElements
    private lazy var confirmEditButton: UIButton = UIButton.defaultButton(title: "Confirmar Edição", font: UIFont.MyTheme.defaultText, target: self, selector: #selector(performEdit))
    
    private lazy var deleteRegisterButton: UIButton = {
       let view = UIButton()
        view.setTitle("Excluir", for: .normal)
        view.backgroundColor = .MyTheme.backgroundColor
        view.titleLabel?.font = .MyTheme.defaultText
        view.setTitleColor(UIColor.MyTheme.deleteTextColor, for: .normal)
        view.addTarget(self, action: #selector(performDeleteRegister), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setupLayoutConstraints()
        self.backgroundColor = .MyTheme.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    func setupView(){
        self.addSubview(confirmEditButton)
        self.addSubview(deleteRegisterButton)
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            confirmEditButton.topAnchor.constraint(equalTo: self.topAnchor, constant:  16),
            confirmEditButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            confirmEditButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            deleteRegisterButton.leadingAnchor.constraint(equalTo: confirmEditButton.leadingAnchor),
            deleteRegisterButton.trailingAnchor.constraint(equalTo: confirmEditButton.trailingAnchor),
            deleteRegisterButton.topAnchor.constraint(equalTo: confirmEditButton.bottomAnchor, constant: 16)
        ])
    }
    
    //MARK: - Perform
    @objc func performEdit(){
        viewModel?.updateClient()
    }
    
    @objc func performDeleteRegister() {
        viewModel?.displayAlertWithAction(title: "Deletar", message: "Você está prestes a deletar um cadastro, Tem certeza?")
    }
    
}
