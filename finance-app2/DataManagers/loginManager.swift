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

class loginManager {

    public typealias CompletionObject<T> = (_ response: T) -> Void
    

    
//    func login(user: User, completion: @escaping CompletionObject<FirestoreResponse>) {
//      guard let email = user.email, let password = user.password else { completion(.failure); return }
//      Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
//        if error.isNone {
//          completion(.success)
//          return
//        }
//        completion(.failure)
//      }
//    }
//    
//    func register(user: ObjectUser, completion: @escaping CompletionObject<FirestoreResponse>) {
//      guard let email = user.email, let password = user.password else { completion(.failure); return }
//      Auth.auth().createUser(withEmail: email, password: password) {[weak self] (reponse, error) in
//        guard error.isNone else { completion(.failure); return }
//        user.id = reponse?.user.uid ?? UUID().uuidString
//        self?.update(user: user, completion: { result in
//          completion(result)
//        })
//      }
//    }
}
public enum FirestoreResponse {
  case success
  case failure
}
