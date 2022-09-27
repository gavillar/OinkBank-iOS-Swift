//
//  Pix.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/18/22.
//

import Foundation

struct Pix {
    var account: Int
    var agency: String = "1-9"
    var cpfKey: String
    var randomKey: String
    var phoneKey: String
    var copyPastePix: String
    
    var emailKey: String
}

var allPix: [Pix] = [Pix(account: 1, agency: "1-9", cpfKey: "Cadastrar Nova Chave", randomKey: "Cadastrar Nova Chave", phoneKey: "Cadastrar Nova Chave", copyPastePix: "", emailKey: "Cadastrar Nova Chave"), Pix(account: 2, agency: "1-9", cpfKey: "Cadastrar Nova Chave", randomKey: "Cadastrar Nova Chave", phoneKey: "Cadastrar Nova Chave", copyPastePix: "", emailKey: "Cadastrar Nova Chave")]
//var allPix: [Pix] = []

var editPixIndex = 0

var valueFromCopyPasteKey = 0.0
var cpfFromCopyPasteKey = ""
