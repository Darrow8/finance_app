//
//  userDataManager.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/17/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import Foundation
import SwiftUI


struct User {
    var username: String
    var name: String
    var portfolioID: String
    var friendList: [Friend]
    //sets up user account after being logged in
//    func setupUser() -> User{
//
//    }
    //prints all user data
    func printUser(){
        print("username: \(username)")
        print("name: \(name)")
        print("portfolio: \(portfolioID)")
        print("friendList: \(friendList)")
        print("username: \(username)")

    }
}

struct Portfolio{
    var stockList : [Stock]
    var viewingStockList : [Stock]
//    var historicalBalance : [String: Int]
    var currentBalance : Int
//    var timeMargin : [String:Int]
//    var DayLong: [String:String]

    
    //data for every 5 min
//    func presentDaylong(User: User) -> Dictionary{
//        return firestoreManager().getData(collection: "Portfolio", documentVar: User.portfolioID, documentField: "PortfolioID")[""]
//    }
    //data for every hour
//    func presentWeeklong(){
//
//    }
//    //data for every day
//    func presentMonthlong(){
//
//    }
//    //data for every day
//    func present3Monthlong(){
//
//    }
//    //data for every day
//    func presentAnnuallong(){
//
//    }
//    //data for every week
//    func presentTotallong(){
//
//    }
}

struct Friend{

}

struct Stock{
    var price : Int

}
