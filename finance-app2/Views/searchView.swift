//
//  searchView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import NavigationStack

struct searchView: View {
        @State private var isActive = false
        @State private var isNotActive = false
    var body: some View {
        NavigationStackView {
//            VStack{
                PushView(destination: newsView(), isActive: $isNotActive) {
                    Text("")
                }
                PopView(isActive: $isActive){
                    Text("")
                }
                Button(action: {
                    if(loginManager().isInNav){
                    self.isActive.toggle()
                    loginManager().isInNav = false
                    }else{
                    self.isNotActive.toggle()
                    loginManager().isInNav = true
                    }
                }, label: {
                    Text("Trigger push")
                })
//            }
        }
    }
}

struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}
