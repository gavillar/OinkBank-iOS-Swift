//
//  AllPix+CoreDataProperties.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/18/22.
//
//

import Foundation
import CoreData


extension AllPix {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AllPix> {
        return NSFetchRequest<AllPix>(entityName: "AllPix")
    }

    @NSManaged public var account: Int64
    @NSManaged public var agency: String?
    @NSManaged public var cpfKey: String?
    @NSManaged public var randomKey: String?
    @NSManaged public var phoneKey: String?
    @NSManaged public var copyPastePix: String?

}

extension AllPix : Identifiable {

}
