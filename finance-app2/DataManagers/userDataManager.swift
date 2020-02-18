////
////  userDataManager.swift
////  finance-app2
////
////  Created by Darrow Hartman on 2/17/20.
////  Copyright © 2020 Darrow Hartman. All rights reserved.
////
//
//import Foundation
//
//
//struct User {
//    var username: String
//    var name: String
//    var portfolioID: String
//    var friendList: [Friend]
//    //sets up user account after being logged in
//    func setupUser(){
//        let userData = firestoreManager().getData(collection: "Users", documentVar: username, documentField: "Username")
//        let portfolioData = firestoreManager().getData(collection: "Portfolios", documentVar: portfolioID, documentField: "PortfolioID")
//        
//        User.init(username: data["Username"], name: data["Name"], portfolio: <#T##Portfolio#>, friendList: <#T##[Friend]#>)
//        
//    }
//    //prints all user data
//    func printUser(){
//        print("username: \(username)")
//        print("name: \(name)")
//        print("portfolio: \(portfolio)")
//        print("friendList: \(friendList)")
//        print("username: \(username)")
//
//    }
//}
//
//struct Portfolio{
//    var stockList : [Stock]
//    var viewingStockList : [Stock]
//    var historicalBalance : [String: Int]
//    var currentBalance : Int
//    var timeMargin : [String: Int]
//    
//    
//}
//
//struct Friend{
//    
//}
//
//struct Stock{
//    
//}
