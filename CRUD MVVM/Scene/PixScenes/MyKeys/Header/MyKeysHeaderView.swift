//
//  MyKeysHeaderView.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/24/22.
//

import UIKit

class MyKeysHeaderView: UIView {

    static let Height: CGFloat = 40
    
    weak var viewModel: MyKeysViewModel?
    
    //MARK: - UIElements
    private lazy var descriptionLabel: UILabel = {
       let view = UILabel()
        view.text = "Visualize, adicione ou exclua chaves Pix:"
        view.font = .MyTheme.defaultBoldText
        view.numberOfLines = -1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - init
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .MyTheme.backgroundColor
        setupView()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupVIew
    private func setupView() {
        self.addSubview(descriptionLabel)
    }
    
    //MARK: - setupLayoutConstraints
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
        ])
    }

}
