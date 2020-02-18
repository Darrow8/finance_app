//
//  homepageView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import Foundation
import SwiftUICharts
import UIKit


struct homepageView: View {
    let portfolioData = firebaseOutputManager().portfolioData()
    print(portfolioData)
    var body: some View {
        LineView(data: [8,23,54,32,12,37,7,23,43], title: "$XYZ", legend: "Full screen") // legend is optional, use optional .padding()
    }
    
}

struct homepageView_Previews: PreviewProvider {
    static var previews: some View {
        homepageView()
    }
}

