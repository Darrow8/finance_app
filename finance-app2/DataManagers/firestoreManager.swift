//
//  firebaseOutputManager.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import Firebase

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
    func getData(collection: String, documentVar: String, documentField: String) -> Any{
        var info: Any
        db.collection(collection).whereField(documentVar, isEqualTo: documentField)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    info = err
                } else {
                    for document in querySnapshot!.documents {                        info = document.data()
                    }
                }
        }
        return info
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
        var returnVal : Any
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
        var returnVal: Any
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

        // Set the "capital" field of the city 'DC'
        ref.updateData(docData) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}

