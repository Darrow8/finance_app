//
//  homepageView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import Foundation
//import SwiftUICharts


struct homepageView: View {
    
    @State private var selectorIndex = 0
    @State private var numbers = ["One","Two","Three"]
//    var theUser: User = loginManager().login(username: "Darrow H")
//    private var porty: Portfolio
    @State var data: [Double] = [0,1,2]
    private var graphTimeline: Int = 0
//   @State var userInfo: User
//    var userInfo = User.setupUser(User)
    var body: some View {
        var userInfo: User = User(username: "", name: "", portfolioID: "", friendList: [])
        var theData: [Double] = self.data
        firestoreManager().getUserData(collection: "Users", documentVar: "darrow_h19", documentField: "Username").then{ user in
//            print(user)
            userInfo = user
//            self.data = userInfo.updateStockChart(portfolioID: userInfo.portfolioID)
            theData = userInfo.updateStockChart(portfolioID: "123456")
            //LineView.init(data: <#T##[Double]#>, totalPoints: <#T##Int#>)
//            print(Double(theData[0]))
//            let chartData: [Int: Int] = userInfo.updateStockChart(portfolioID: "123456")
//            data = chartData
            print("HERE3")
            print(theData)
        }
//        self.data = theData
        print("HERE2")
        print(theData)
        return VStack {

//            for reference, there should be 288 totalPoints
//            self.theUser = loginManager().login(username: "darrow_h19")
//            if(graphTimeline == 0){
//                theUser.portfolioID
                
            LineView(data: theData, title: "$XYZ", legend: "Hello World",totalPoints: 18,yPosChange: 300)
//            }
//            Text("Hello")
//
//            Picker("Numbers", selection: $selectorIndex) {
//                ForEach(0 ..< numbers.count) { index in
//                    Text(self.numbers[index]).tag(index)
//                }
//                }.pickerStyle(SegmentedPickerStyle()).position(x: 0, y: 500)
//
        }

    }
//    mutating func prepareGraph(){
//        theUser = loginManager().login(username: "darrow_h19")
//        thePortfolio = firestoreManager().getData(collection: "Portfolios", documentVar: self.theUser.portfolioID, documentField: "PortfolioID") as! Portfolio
//
//    }
}

struct homepageView_Previews: PreviewProvider {
    static var previews: some View {
        homepageView()
    }
}

