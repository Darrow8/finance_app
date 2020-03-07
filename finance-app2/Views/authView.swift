//
//  authView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI

struct authView: View {
        @State private var email = ""
        @State private var password = ""
        
        // MARK: - View
        var body: some View {
            VStack() {
//                Text("iOS App Templates")
//                    .font(.largeTitle).foregroundColor(Color.white)
//                    .padding([.top, .bottom], 40)
//                    .shadow(radius: 10.0, x: 20, y: 10)
                
//                Image("iosapptemplate")
//                    .resizable()
//                    .frame(width: 250, height: 250)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                    .shadow(radius: 10.0, x: 20, y: 10)
//                    .padding(.bottom, 50)
                
                HStack(){
                    Text("Manage a portfolio")
//                    Spacer()
                    Text("Play against friends")
                }
                .frame(width: 250, height: 440)

//                Spacer()
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                Button(action: {}) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding(.top, 50)
                
                Spacer()
                HStack(spacing: 0) {
                    Text("Don't have an account? ")
                    Button(action: {}) {
                        Text("Sign Up")
                            .foregroundColor(.black)
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
            
        }
    }


struct authView_Previews: PreviewProvider {
    static var previews: some View {
        authView()
    }
}
