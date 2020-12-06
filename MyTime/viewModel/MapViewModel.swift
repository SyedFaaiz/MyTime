//
//  MapViewModel.swift
//  MyTime
//
//  Created by Syed Rehan on 2020-12-06.
//

import Foundation
// import Firebase
import SwiftUI
import os

class ParkingViewModel: ObservableObject{
    @Published var UserList = [User]()
    
    //private var db = Firestore.firestore()
    private let COLLECTION_NAME = "Users"
    /*
    func addUser(newUser: User){
        do{
            _ = try db.collection(COLLECTION_NAME).addDocument(from: newParking)
        }catch let error as NSError{
            print(#function, "Error creating document : \(error.localizedDescription)")
        }
    }
    
    func getAllParkings(){
//        let email = userSettings.userEmail
        let email = UserDefaults.standard.string(forKey: "KEY_EMAIL")
        
        db.collection(COLLECTION_NAME)
            .whereField("email", isEqualTo: email as Any)
            .order(by: "parkingDate", descending: true)
            .addSnapshotListener({ (querySnapshot, error) in
                
                guard let snapshot = querySnapshot else{
                    print(#function, "Error fetching documents \(error!.localizedDescription)")
                    return
                }
                
                //succesfully received documents
                snapshot.documentChanges.forEach{(doc) in
                    var parking = Parking()
                    
                    do{
                        parking = try doc.document.data(as: Parking.self)!
                        
                        if doc.type == .added{
                            
                            if (!self.parkingList.contains(parking)){
                                self.parkingList.append(parking)
                            }
                        }
                        
                        if doc.type == .modified{
                            //TODO for updated document
                        }
                        
                        if doc.type == .removed{
                            //TODO for deleted document
                            let docID = doc.document.documentID
                            
                            let index = self.parkingList.firstIndex(where: {
                                ($0.id?.elementsEqual(docID))!
                            })
                            
                            if (index != nil){
                                self.parkingList.remove(at: index!)
                            }
                        }
                        
                        self.parkingList.sort{ (currentObj, nextObj) in
                            currentObj.parkingDate > nextObj.parkingDate
                        }
                        
//                        print(#function, "Parking List : ", self.parkingList)
                    }catch let error as NSError{
                        print("Error decoding document : \(error.localizedDescription)")
                    }
                }
            })
    }
    
    func deleteParking(index: Int){
        db.collection(COLLECTION_NAME)
            .document(self.parkingList[index].id!)
            .delete{ (error) in
                
                if let error = error{
                    Logger().error("Error deleting document \(error.localizedDescription)")
                }else{
                    Logger().debug("Document successfully deleted.")
                }
                
            }
    }
    
    //takehome - add all the fields of parking object in the updateData() method below.
    //Use the updateParking() method in your app to update the parking detail modified by user.
    //You will have to create a new UpdateParkingView() to provide UI to the user for modifying the
    //parking details. You may open the UpdateParkingView() on tap gesture of list item and pass teh parking object along to retrieve all the values of the parking being tapped.
    func updateParking(parking: Parking, index: Int){
        
        db.collection(COLLECTION_NAME)
            .document(self.parkingList[index].id!)
            .updateData(["buldingCode" : parking.buildingCode, "parkingDate" : parking.parkingDate]){ (error) in
                if let error = error{
                    Logger().error("Error updating document \(error.localizedDescription)")
                }else{
                    Logger().debug("Document successfully updated.")
                }
            }
    }
 */
}

