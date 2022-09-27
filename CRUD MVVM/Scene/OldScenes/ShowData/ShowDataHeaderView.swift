//
//  ShowDataHeaderView.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit

class ShowDataHeaderView: UIView {
    static let height: CGFloat = 40
    
    //MARK: - UIElements
    lazy var searchBar: UISearchBar = {
       let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cpfLabel: UILabel = {
       let view = UILabel()
        view.text = "CPF"
        view.textColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
       let view = UILabel()
        view.text = "Nome"
        view.textColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = .systemBackground
        //self.addSubview(searchBar)
        self.addSubview(cpfLabel)
        self.addSubview(nameLabel)
    }
    
    private func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
//            searchBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            searchBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
//            searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            cpfLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cpfLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: cpfLabel.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
