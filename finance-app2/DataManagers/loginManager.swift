//
//  loginManager.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/20/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

public class loginManager {

    let db = Firestore.firestore()
    
    //for alternating views
    var isInNav = false
    

    public typealias CompletionObject<T> = (_ response: T) -> Void
    
    func setupData(user: User, completion: @escaping CompletionObject<FirestoreResponse>){
        self.db.collection("Users").whereField(user.username!, isEqualTo: "username")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion(.failure)
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data() as Dictionary
                        
//                        let user = User(username: data["Username"] as! String, name: data["Name"] as! String, portfolioID: data["PortfolioID"] as! String, friendList: [])
                        let user = User(username: user.username!, name: data["Name"] as! String, number: data["number"] as! String, password: "", portfolioID: data["PortfolioID"] as! String)
                        
//                        return user
                        print(user.printUser())
                        completion(.success)
                    }
                }
        }
    }
    
    
    func initData(user: User, completion: @escaping CompletionObject<FirestoreResponse>){
        let col = self.db.collection("Users")
        var ref: DocumentReference? = nil

        let docData : [String: Any] = [
            "Username": user.username!,
            "Name": user.name!,
            "Number": user.number!,
            "portfolioID": ""
        ]
        ref = col.addDocument(data: docData) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(.failure)
            } else {
                print("Document added with ID: \(ref!.documentID)")
                let newPort: [String: Any] = [
                    "portfolioID": String(ref!.documentID)
                ]
                col.document(ref!.documentID).updateData(newPort) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                        completion(.failure)
                    } else {
                        print("Document successfully written!")
                        completion(.success)
                    }
                }
            }
        }
    }
    
    
    func login(user: User, completion: @escaping CompletionObject<FirestoreResponse>) {
      guard let username = user.username, let password = user.password else { completion(.failure); return }
        let email = username + "@finance.com"
      Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
        print(error)

        if error.isNone {
          completion(.success)
          return
        }
        completion(.failure)
      }
    }
    
    func register(user: User, completion: @escaping CompletionObject<FirestoreResponse>) {
        
      guard let username = user.username, let password = user.password else { completion(.failure); return }
        let email = username + "@finance.com"
        
        self.db.collection("Users").whereField(user.username!, isEqualTo: "username")
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }else{
//                for document in querySnapshot!.documents {
                if(querySnapshot!.documents.isEmpty){
                Auth.auth().createUser(withEmail: email, password: password) {[weak self] (reponse, error) in
                                 print(error)
                                 guard error.isNone else { completion(.failure); return }
                    loginManager().initData(user: user) { (FirestoreResponse) in
                           print(FirestoreResponse)
                           completion(.success)
                       }
//                                   completion(.success)
                           }
                }
            }
            

            
            
//                else {
//                    completion(.success)
//                }
        
//        user.username = reponse?.user.uid ?? UUID().uuidString
//        self?.update(user: user, completion: { result in
//          completion(result)
//        })
      }
    }
}

extension Optional {
  var isNone: Bool {
    return self == nil
  }
  
  var isSome: Bool {
//    print(self)
    return self != nil
  }
}

