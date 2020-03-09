//
//  newsView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//


import SwiftUI
import UIKit
import NavigationStack
//import You
//import YoutubePlayer_in_WKWebView
//
struct newsView: View {
    @State private var isActive = false
    @State private var isNotActive = false

    var body: some View {
        NavigationStackView {
            VStack{
                PushView(destination: searchView(), isActive: $isNotActive) {
                    Text("PushA")
                }
                PopView(isActive: $isActive){
                    Text("PopA")
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
            }
        }
    }
}

struct newsView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}

