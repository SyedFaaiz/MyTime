//
//  UserViewModel.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-12-06.
//

import Foundation
import CoreData
import SwiftUI
import UIKit

public class UserViewModel : ObservableObject{
    @Published var loggedInUser : User?
    @Published var userList = [User]()
    
    private let moc : NSManagedObjectContext
    
    init(context: NSManagedObjectContext)
    {
        self.moc = context
    }
    
    func insertUser(name: String, email: String, password: String, phoneNumber: String, address: String)
    {
        do
        {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: moc) as! User
           
            newUser.name = name
            newUser.email = email
            newUser.password = password
            newUser.phoneNumber = phoneNumber
            newUser.address = address
            
            
            try moc.save()
            
            print("User account created")
        }
        catch let error as NSError{
            print("Something went wrong. Couldn't create account.")
            print("\(error) \(error.localizedDescription)")
        }
    }
    
    func insertUserCompany(name: String, email: String, password: String, phoneNumber: String, address: String)
    {
        do
        {
            let newUserCompany = NSEntityDescription.insertNewObject(forEntityName: "User", into: moc) as! User
            newUserCompany.name = name
            newUserCompany.email = email
            newUserCompany.password = password
            newUserCompany.phoneNumber = phoneNumber
            newUserCompany.address = address
          
            
            try moc.save()
            
            print("New Company inserted")
        }
        catch let error as NSError{
            print("Something went wrong. Couldn't create account.")
            print("\(error) \(error.localizedDescription)")
        }
    }
    
    func findUserByEmail(email: String)
    {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        let predicate = NSPredicate(format: "email == %@", email)
        fetchRequest.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do
        {
            if let matchedUser = try moc.fetch(fetchRequest).first
            {
                self.loggedInUser = matchedUser
                print("Matching user found")
            }
        }
        catch let error as NSError
        {
            print("Error Fetching")
            print("\(error) \(error.localizedDescription)")
        }
    }
        
        func getAllUsers()
        {
            let fetchRequest = NSFetchRequest<User>(entityName: "User")
            do
            {
                let result = try moc.fetch(fetchRequest)
                userList = result as [User]
            }
            catch let error as NSError
            {
                print(#function, "Couldn't fetch \(error.localizedDescription)")
            }
        }
        func updateUser()
        {
            do{
                try moc.save()
                
                print(#function, "The user info has been updated successfully")
            }catch let error as NSError{
                print(#function, "Unable to update user info \(error.localizedDescription)")
            }
        }
        
        func deleteUser(){
            do{
                moc.delete(loggedInUser! as NSManagedObject)
                try moc.save()
                
                print(#function, "User account successfully deleted.")
            }catch let error as NSError{
                print(#function, "Cannot delete user account \(error.localizedDescription)")
            }
        }
}
