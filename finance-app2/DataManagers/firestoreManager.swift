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
    
    func fakeGetData(collection: String, documentVar: String, documentField: String) -> Promise<NSDictionary>{
            return Promise<NSDictionary>{ fulfill, reject in
                let userData:NSDictionary = [
                    "username": "darrow_h19",
                    "Name": "Darrow H",
                    "portfolioID":"123456",
                    "friendList": {}
                ]
                if(true){
                    fulfill(userData)
                }else{
                    let randomError: Error = Errors.overflow
                    reject(randomError)
                }
            }
        }
    
    func getData(collection: String, documentVar: String, documentField: String) -> Promise<NSDictionary>{
        return Promise<NSDictionary>{ fulfill, reject in
//        var info: NSDictionary = [0:0]
            self.db.collection(collection).whereField(documentVar, isEqualTo: documentField)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                   reject(err)
                } else {
                    for document in querySnapshot!.documents {
                        let user = document.data() as NSDictionary
                        fulfill(user)
                    }
                }
        }
//            return info
        }
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

