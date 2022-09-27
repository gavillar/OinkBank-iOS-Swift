//
//  Fonts.swift
//  CRUD MVVM
//
//  Created by user217586 on 6/9/22.
//

import Foundation
import UIKit

extension UIFont {
      struct MyTheme {
          static var defaultText: UIFont = UIFont(name: "Nunito-Regular", size: 17) ?? .systemFont(ofSize: 17)
          static var defaultBoldText: UIFont = UIFont(name: "Nunito-Bold", size: 17) ?? .boldSystemFont(ofSize: 17)
          static var boldTitleText: UIFont = UIFont(name: "Nunito-Bold", size: 24) ?? .boldSystemFont(ofSize: 24)
          static var homeHeaderText: UIFont = UIFont(name: "Nunito-Regular", size: 21) ?? .systemFont(ofSize: 21)
          static var myKeysText: UIFont = UIFont(name: "Nunito-Regular", size: 12) ?? .systemFont(ofSize: 12)
          static var tipText: UIFont = UIFont(name: "Nunito-Regular", size: 12) ?? .systemFont(ofSize: 14)
      }
}
