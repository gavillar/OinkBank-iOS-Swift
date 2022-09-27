//
//  Client.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation

struct Client {
    var name: String
    var cpf: String
    var birthDate: String
    var email: String
    var monthlyIncome: String
    var netWorth: String
    var password: String
    var agency: String = "1-9"
    var balance: Double
    var account: Int
    
    var verifyDigit: Int
}
//teste dboteste


var clients: [Client] = [Client(name: "ADM", cpf: "198.234.930-14", birthDate: "", email: "", monthlyIncome: "", netWorth: "", password: "1", balance: 999.9, account: 1, verifyDigit: 2), Client(name: "teste", cpf: "504.484.900-64", birthDate: "", email: "", monthlyIncome: "", netWorth: "", password: "1", agency: "1-9", balance: 0.0, account: 2, verifyDigit: 7)]
//var clients: [Client] = []

//Login/Edit Index
var editIndex = 0
var loginIndex = 0
