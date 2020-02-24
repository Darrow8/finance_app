//
//  loginManager.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/20/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import Foundation
import SwiftUI

class loginManager {
     func login(username: String) -> User{
//        let userData = firestoreManager().getData(collection: "Users", documentVar: username, documentField: "Username").then { user in
//            return user
//        }
    let userData = firestoreManager().fakeGetData(collection: "Users", documentVar: username, documentField: "Username").then{ userData in
            return userData as NSDictionary
        }.then {data -> User in
            let portfolioID = "123456"
            let theUser =  User(username: (data["Username"] as? String)!, name: data["Name"]! as! String, portfolioID: portfolioID, friendList: data["Friends"]! as! [Friend])
            return theUser as! User
        }
        return userData
    }
    
}
