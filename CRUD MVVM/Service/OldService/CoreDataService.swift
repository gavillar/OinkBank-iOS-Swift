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
//final class CoreDataService {
//    //MARK: - addClient
//    func addClient(newClient: Client){
//
//        //CoreData Create
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Clients", in: context)
//
//        //Add NewClient
//        let newClientCore = Clients(entity: entity!, insertInto: context)
//        newClientCore.cpf = newClient.cpf
//        newClientCore.monthlyIncome = newClient.monthlyIncome
//        newClientCore.email = newClient.email
//        newClientCore.birthDate = newClient.birthDate
//        newClientCore.name = newClient.name
//        newClientCore.netWorth = newClient.netWorth
//        newClientCore.password  = newClient.password
//        newClientCore.agency = newClient.agency
//        newClientCore.account = Int64(newClient.account)
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
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Clients")
//        request.returnsObjectsAsFaults = false
//        do{
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject]{
//                clients.append(Client(name:data.value(forKey: "name") as! String? ?? "", cpf:data.value(forKey: "cpf") as! String? ?? "", birthDate:data.value(forKey: "birthDate") as! String? ?? "", email: data.value(forKey: "email") as! String? ?? "", monthlyIncome:data.value(forKey: "monthlyIncome") as! String? ?? "", netWorth: data.value(forKey: "netWorth") as! String? ?? "", password: data.value(forKey: "password") as! String? ?? "", balance: data.value(forKey: "balance") as! Double? ?? 0.0, account: data.value(forKey: "account") as! Int? ?? -1, verifyDigit: data.value(forKey: "verifyDigit") as! Int? ?? -1))
//            }
//        }catch{
//            print("Fetch data failed")
//        }
//    }
//    
//    //MARK: - Update
//    func updateClient(editClient: Client){
//        // ATUALIZAR INFORMAÇÕES CORE DATA CONTA ATUAL
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Clients")
//        let predicate = NSPredicate(format: "cpf = '\(editClient.cpf)'")
//        fetchRequest.predicate = predicate
//        do
//        {
//            let object = try context.fetch(fetchRequest)
//            if object.count == 1
//            {
//                let objectUpdate = object.first as! NSManagedObject
//                objectUpdate.setValue(editClient.name, forKey: "name")
//                objectUpdate.setValue(editClient.cpf, forKey: "cpf")
//                objectUpdate.setValue(editClient.birthDate, forKey: "birthDate")
//                objectUpdate.setValue(editClient.email, forKey: "email")
//                objectUpdate.setValue(editClient.monthlyIncome, forKey: "monthlyIncome")
//                objectUpdate.setValue(editClient.netWorth, forKey: "netWorth")
//                objectUpdate.setValue(editClient.password, forKey: "password")
//                objectUpdate.setValue(editClient.balance, forKey: "balance")
//                objectUpdate.setValue(editClient.account, forKey: "account")
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
//        deleteAllData(entity: "Clients")
//        
//        updateAllData(clients: clients)
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
//    func updateAllData(clients: [Client]){
//        for i in 0...clients.count-1{
//            let newClient = clients[i]
//            //CoreData Create
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let entity = NSEntityDescription.entity(forEntityName: "Clients", in: context)
//
//            //Add NewClient
//            let newClientCore = Clients(entity: entity!, insertInto: context)
//            newClientCore.cpf = newClient.cpf
//            newClientCore.monthlyIncome = newClient.monthlyIncome
//            newClientCore.email = newClient.email
//            newClientCore.birthDate = newClient.birthDate
//            newClientCore.name = newClient.name
//            newClientCore.netWorth = newClient.netWorth
//            newClientCore.balance = newClient.balance
//            newClientCore.password = newClient.password
//            newClientCore.account = Int64(newClient.account)
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
