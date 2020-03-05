//
//  firebaseOutputManager.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import Firebase
import Promises


//MARK: Firestore Output and Input Manager
// For, ya know, talking to the DB 


class firestoreManager {
    
    let db = Firestore.firestore()
    
    /**
        Gets collection, documentVar, and documentField from params and recieves from firebase
     
            Parameter collection: setting the collection to recieve info from
            Parameter documentVar: setting the variable to match the document to
            Parameter documentField: setting the field to match the document to
            
     */
    enum Errors: Error {
        case overflow
        case invalidInput(Character)
    }
    
    func getUserData(collection: String, documentVar: String, documentField: String) -> Promise<User>{
        
        
        let promise = Promise<User>(on: .main) { fulfill, reject in
          // Called asynchronously on the dispatch queue specified.
            
            self.db.collection(collection).whereField(documentField, isEqualTo: documentVar)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let data = document.data() as Dictionary
                            let user = User(username: data["Username"] as! String, name: data["Name"] as! String, portfolioID: data["PortfolioID"] as! String, friendList: [])
                            fulfill(user)
                        }
                    }
            }
        }
        return promise
    }
    func getPortfolioData(collection: String, documentVar: String, documentField: String) -> Promise<Portfolio>{
        
        
        let promise = Promise<Portfolio>(on: .main) { fulfill, reject in
          // Called asynchronously on the dispatch queue specified.
            
            self.db.collection(collection).whereField(documentField, isEqualTo: documentVar)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let data = document.data() as Dictionary
                            let user = Portfolio(stockList: data["stocks"] as! [String], viewingStockList: [], currentBalance: data["currentBalance"] as! Int, DayLong: data["DayLong"] as! [Int : Int])
                            fulfill(user)
                        }
                    }
            }
        }
        return promise
    }
            
    /**
        Uses collection, documentVar, and documentField from params and sets firebase documents
        WARNING!  -- DO NOT USE UNLESS CERTAIN
        This function will override previous data
     
             Parameter collection: setting the collection to recieve info from
             Parameter documentVar: setting the variable to match the document to
             Parameter documentField: setting the field to match the document to
     
     */
    func setData(collection: String, docId: String, docData: [String: Any]) -> Any{
        var returnVal : Any = 0
        // Add a new document in collection "cities"
        db.collection(collection).document(docId).setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
                returnVal = err
            } else {
                print("Document successfully written!")
                returnVal = "Document successfully written!"
            }
        }
        return returnVal
    }
    /**
        Gets collection, documentVar, and documentField from params and enters into firebase
     */
    func addData(collection: String, docData: [String : Any]) -> Any{
        var returnVal : Any = 0
        var ref: DocumentReference? = nil
        ref = db.collection(collection).addDocument(data: docData) { err in
            if let err = err {
                print("Error adding document: \(err)")
                returnVal = err
                
            } else {
                print("Document added with ID: \(ref!.documentID)")
                returnVal = ref!.documentID
            }
        }
        return returnVal
    }
    /**
        Gets collection, documentVar, and documentField from params and enters into firebase
     */
    func updateData(collection: String, docId: String, docData: [String: Any]) -> Any{
        let ref = db.collection(collection).document(docId)
        var returnVal : Any = 0
        
        // Set the "capital" field of the city 'DC'
        ref.updateData(docData) { err in
            if let err = err {
                print("Error updating document: \(err)")
                returnVal = err
            } else {
                print("Document successfully updated")
                returnVal = "Document successfully updated"
            }
        }
        return returnVal
    }
}

