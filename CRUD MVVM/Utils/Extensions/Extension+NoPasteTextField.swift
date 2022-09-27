//
//  Extension+NoPasteTextField.swift
//  CRUD MVVM
//
//  Created by user220831 on 6/29/22.
//

import Foundation
import UIKit //Don't forget this


class NoPasteTextField: UITextField {


override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
if action == #selector(UIResponderStandardEditActions.paste(_:)) {
return false
}
return super.canPerformAction(action, withSender: sender)
}

}
