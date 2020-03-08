//
//  authView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI

struct registerView: View {
        @State private var number = ""
        @State private var password = ""
        @State private var username = ""
        @State private var name = ""
        @State private var showLinkTarget = false

        
        // MARK: - View
    var body: some View {
            NavigationView{
                VStack {
                    Text("Finance App Signup")
                        .font(.largeTitle).foregroundColor(Color.white)
                        .padding([.top, .bottom], 40)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
    //                Image("iosapptemplate")
    //                    .resizable()
    //                    .frame(width: 250, height: 250)
    //                    .clipShape(Circle())
    //                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
    //                    .shadow(radius: 10.0, x: 20, y: 10)
    //                    .padding(.bottom, 50)
                    
    //                HStack(){
    //                    Text("Manage a portfolio")
    ////                    Spacer()
    //                    Text("Play against friends")
    //                }
    //                .frame(width: 250, height: 440)

                    Spacer()
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Name", text: self.$name)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                        TextField("Username", text: self.$username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                        TextField("Number", text: self.$number)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                            .textContentType(.oneTimeCode)
                            .keyboardType(.numberPad)
                        SecureField("Password", text: self.$password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }.padding([.leading, .trailing], 27.5)
//                    NavigationLink(destination: homepageView().navigationBarBackButtonHidden(true)){
                    Button(action: {loginManager().register(user: User( username:self.username,name: self.name,number: self.number, password: self.password)) { (Response) in
                        print(Response)
                        print("DONE")
                        self.showLinkTarget = true
                        }}) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }.padding(.top, 50)
                    NavigationLink(destination: homepageView().navigationBarBackButtonHidden(true), isActive: self.$showLinkTarget ) {
                       Spacer().fixedSize()
                    }
//                    }
                    Spacer()
                    HStack{
                        Text("Don't have an account? ")
                            Button(action: {}) {
                            NavigationLink(destination: loginView()){
                                Text("Sign In")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                
            }
        }
    }


struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerView()
    }
}
