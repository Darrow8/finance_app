//
//  loginView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 3/7/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI


struct loginView: View {
            @State private var username = ""
            @State private var password = ""
            @State private var showLinkTarget = false

            
            // MARK: - View
        var body: some View {
            NavigationView{
                VStack {
                    Text("Finance App Login")
                        .font(.largeTitle).foregroundColor(Color.white)
                        .padding([.top, .bottom], 40)
                        .shadow(radius: 10.0, x: 20, y: 10)

                    Spacer()
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Username", text: self.$username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
//                            .textContentType(.oneTimeCode)
//                            .keyboardType(.numberPad)
                        
                        SecureField("Password", text: self.$password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                    }.padding([.leading, .trailing], 27.5)
                     
                    Button(action: {loginManager().login(user: User(username: self.username, password: self.password)) { (FirestoreResponse) in
                            print(FirestoreResponse)
                            print("FINISHED")
                            self.showLinkTarget = true
                        }}) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                            NavigationLink(destination: homepageView().navigationBarBackButtonHidden(true), isActive: self.$showLinkTarget ) {
                               Spacer().fixedSize()
                            }
                    }.padding(.top, 50)
                    Spacer()
                    HStack{
                        Text("Don't have an account? ")
                        Button(action: {}) {
                            
                            NavigationLink(destination: registerView()){

                                Text("Sign Up")
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

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
