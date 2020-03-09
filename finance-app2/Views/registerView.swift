//
//  authView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import NavigationStack

struct registerView: View {
    @State private var number = ""
    @State private var password = ""
    @State private var username = ""
    @State private var name = ""
    @State private var showLinkTarget = false
    @State private var isActive = false
    @State private var isNotActive = false
    // MARK: - View
    var body: some View {
        NavigationStackView{
            NavigationView{
                VStack {
                    Text("Finance App Signup")
                        .font(.largeTitle).foregroundColor(Color.white)
                        .padding([.top, .bottom], 40)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    // MARK: - Signup Fields
                    
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
                    // MARK: - Signup Button
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
                        // MARK: - View Switch
                        Text("Have an account? ")
                        PushView(destination: loginView(), isActive: $isNotActive) {
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
                            Text("Login")
                                .foregroundColor(.black)
                        })
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all))
                
            }
        }
    }
}


struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerView()
    }
}
