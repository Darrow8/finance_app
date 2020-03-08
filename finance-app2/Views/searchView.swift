//
//  searchView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI

struct searchView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Hello World")
                NavigationLink(destination: homepageView().navigationBarBackButtonHidden(true)) {
                    Text("Do Something")
                }
            }
        }
    }
}

struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}
