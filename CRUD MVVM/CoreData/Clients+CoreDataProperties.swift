//
//  Clients+CoreDataProperties.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/13/22.
//
//

import Foundation
import CoreData


extension Clients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clients> {
        return NSFetchRequest<Clients>(entityName: "Clients")
    }

    @NSManaged public var agency: String?
    @NSManaged public var balance: Double
    @NSManaged public var birthDate: String?
    @NSManaged public var cpf: String?
    @NSManaged public var email: String?
    @NSManaged public var monthlyIncome: String?
    @NSManaged public var name: String?
    @NSManaged public var netWorth: String?
    @NSManaged public var password: String?
    @NSManaged public var account: Int64

}

extension Clients : Identifiable {

}
