////
////  CoreDataService.swift
////  CRUD MVVM
////
////  Created by user210203 on 5/5/22.
////
//
//import Foundation
//import CoreData
//import UIKit
//
//final class CoreDataPixService {
//    //MARK: - addClient
//    func addClientPix(newClientPix: Pix){
//
//        //CoreData Create
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "AllPix", in: context)
//
//        //Add NewClient
//        let newClientPixCore = AllPix(entity: entity!, insertInto: context)
//        newClientPixCore.agency = newClientPix.agency
//        newClientPixCore.account = Int64(newClientPix.account)
//        newClientPixCore.cpfKey = newClientPix.cpfKey
//        newClientPixCore.randomKey = newClientPix.randomKey
//        newClientPixCore.phoneKey = newClientPix.phoneKey
//        newClientPixCore.copyPastePix = newClientPix.copyPastePix
//
//        do{
//            try context.save()
//            print("DEU CERTO")
//        }
//        catch{
//            print("context save error")
//        }
//    }
//    
//    //MARK: - Fetch
//    func fetchData(){
//        // SQLite Directory
//        let container = NSPersistentContainer(name: "CRUD_MVVM")
//        print("Diretorio do core data: \(String(describing: container.persistentStoreDescriptions.first!.url))")
//        
//        // Fetch core data
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        //trazer informação
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AllPix")
//        request.returnsObjectsAsFaults = false
//        do{
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject]{
//                allPix.append(Pix(account: data.value(forKey: "account") as! Int? ?? -1, agency: data.value(forKey: "agency") as! String? ?? "", cpfKey:data.value(forKey: "cpfKey") as! String? ?? "", randomKey: data.value(forKey: "randomKey") as! String? ?? "", phoneKey: data.value(forKey: "phoneKey") as! String? ?? "", copyPastePix: data.value(forKey: "copyPastePix") as! String? ?? ""))
//            }
//        }catch{
//            print("Fetch data failed")
//        }
//    }
//    
//    //MARK: - Update
//    func updateClientPix(editClientPix: Pix){
//        // ATUALIZAR INFORMAÇÕES CORE DATA CONTA ATUAL
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "AllPix")
//        let predicate = NSPredicate(format: "account = '\(editClientPix.account)'")
//        fetchRequest.predicate = predicate
//        do
//        {
//            let object = try context.fetch(fetchRequest)
//            if object.count == 1
//            {
//                let objectUpdate = object.first as! NSManagedObject
//                objectUpdate.setValue(editClientPix.account, forKey: "account")
//                objectUpdate.setValue(editClientPix.copyPastePix, forKey: "copyPastePix")
//                objectUpdate.setValue(editClientPix.cpfKey, forKey: "cpfKey")
//                objectUpdate.setValue(editClientPix.phoneKey, forKey: "phoneKey")
//                objectUpdate.setValue(editClientPix.randomKey, forKey: "randomKey")
//                objectUpdate.setValue(editClientPix.agency, forKey: "agency")
//                
//                do{
//                    try context.save()
//                    print("DEU CERTO ATUALIZOU")
//                }
//                catch
//                {
//                    print(error)
//                }
//            }
//        }
//        catch
//        {
//            print(error)
//        }
//    }
//    
//    //MARK: delete
//    func deleteClient(){
//        deleteAllData(entity: "AllPix")
//        
//        updateAllData(allPix: allPix)
//    }
//    
//    func deleteAllData(entity: String) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
//            fetchRequest.returnsObjectsAsFaults = false
//
//            do
//            {
//                let results = try managedContext.fetch(fetchRequest)
//                for managedObject in results
//                {
//                    let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
//                    managedContext.delete(managedObjectData)
//                }
//            } catch let error as NSError {
//                print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
//            }
//    }
//    
//    func updateAllData(allPix: [Pix]){
//        for i in 0...allPix.count-1{
//            let newClientPix = allPix[i]
//            //CoreData Create
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let entity = NSEntityDescription.entity(forEntityName: "AllPix", in: context)
//
//            //Add NewClient
//            let newClientPixCore = AllPix(entity: entity!, insertInto: context)
//            newClientPixCore.agency = newClientPix.agency
//            newClientPixCore.account = Int64(newClientPix.account)
//            newClientPixCore.cpfKey = newClientPix.cpfKey
//            newClientPixCore.randomKey = newClientPix.randomKey
//            newClientPixCore.phoneKey = newClientPix.phoneKey
//            newClientPixCore.copyPastePix = newClientPix.copyPastePix
//
//            do{
//                try context.save()
//                print("DEU CERTO")
//            }
//            catch{
//                print("context save error")
//            }
//
//        }
//            }
//}
