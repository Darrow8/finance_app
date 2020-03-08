//
//  userDataManager.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/17/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


struct User {
    var username: String?
    var name: String?
    var number: String?
    var password: String?
    var portfolioID: String?
//    var friendList: [String]?
    
    
    
//    init(<#parameters#>) {
//        <#statements#>
//    }
    //prints all user data
    func printUser(){
        print("username: \(username)")
        print("name: \(name)")
        print("portfolio: \(portfolioID)")
//        print("friendList: \(friendList)")
        print("username: \(username)")

    }
//        func currentUserData(_ completion: @escaping CompletionObject<User?>) {
//          guard let id = Auth.auth().currentUser?.uid else { completion(nil); return }
//          let query = FirestoreService.DataQuery(key: "id", value: id, mode: .equal)
//          service.objectWithListener(ObjectUser.self, parameter: query, reference: .init(location: .users), completion: { users in
//            completion(users.first)
//          })
//        }
    func updateStockChart(portfolioID: String) -> [Double]{
//        firestoreManager().getPortfolioData(collection: "Portfolios", documentVar: portfolioID, documentField: "PortfolioID").then{ port in
//            let dayData =  port.DayLong
////            print(dayData)
//        }
        var dict : [Double:Double] = Dictionary()
        //move to 5 minute interval
        let convertTo5Interval : Double = Double(NSDate().timeIntervalSince1970).truncatingRemainder(dividingBy: 300)
        //print(convertTo5Interval)
        for n in 1...50{
            //subtract to get to the 5 min interval
            let time = (Double(NSDate().timeIntervalSince1970) - (Double(n*300) + convertTo5Interval))
            dict[time] = Double.random(in: 450...550)
        }
        let newDict = dict.sorted(by: { $0.key < $1.key })
        var dollarArray: [Double] = Array()
        var timeArray: [Double] = Array()
        for dic in newDict{
            dollarArray.append(dic.value as Double)
            timeArray.append(dic.key as Double)
        }
//        print(timeArray)
//        print(dollarArray)
        print("HERE!")
        return dollarArray
    }
}

struct Portfolio{
    var stockList : [String]
    var viewingStockList : [String]
//    var historicalBalance : [String: Int]
    var currentBalance : Int
//    var timeMargin : [String:Int]
    var DayLong: [Int:Int]

    
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

//struct Friend{
//
//}

//struct Stock{
//    var price : Int
//
//}
