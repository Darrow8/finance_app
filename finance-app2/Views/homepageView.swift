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
    @State var data: [Double] = [0,1,2]
    private var graphTimeline: Int = 0
    var body: some View {
        VStack {
            LineView(data: theData, title: "$XYZ", legend: "Hello World",totalPoints: 18,yPosChange: 150)
            
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

    
}

struct homepageView_Previews: PreviewProvider {
    static var previews: some View {
        homepageView()
    }
}

