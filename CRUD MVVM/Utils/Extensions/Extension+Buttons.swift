//
//  ButtonExtension.swift
//  CRUD MVVM
//
//  Created by user220831 on 6/15/22.
//

import Foundation
import UIKit

extension UIButton {

    static func defaultButton(title: String,font: UIFont = .MyTheme.defaultText, target: Any? = nil, selector: Selector? = nil) -> UIButton {

        let view = UIButton()
        view.backgroundColor = UIColor.MyTheme.mainGreenButtonColor
        view.setTitleColor(.MyTheme.blackColor, for: .normal)
        view.setTitle(title, for: .normal)
        view.titleLabel?.font = font
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.systemFill.cgColor
        view.addTarget(target, action: selector!, for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view

    }
    
    static func transparentButton(title: String,font: UIFont = .MyTheme.defaultText, target: Any? = nil, selector: Selector? = nil) -> UIButton {
        
        let view = UIButton()
        view.setTitleColor(.MyTheme.defaultTextColor, for: .normal)
        view.setTitle(title, for: .normal)
        view.titleLabel?.font = font
        view.addTarget(target, action: selector!, for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.numberOfLines = 0
        
        return view

    }
}
