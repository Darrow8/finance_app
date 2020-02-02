//
//  SignupViewController.swift
//  finance-app2
//
//  Created by Darrow Hartman on 1/1/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailOutlet: UITextField!
    

    @IBOutlet weak var usernameOutlet: UITextField!
    
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    
    @IBAction func SignupPressed(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailOutlet.text!, password: passwordOutlet.text!) { authResult, error in
          if let user = authResult?.user {
              print(user)
//              completionBlock(true)
          } else {
//              completionBlock(false)
            print(error)
          }

            
        }
        
    }
    

    @IBAction func SnapchatPressed(_ sender: Any) {
        
        
    }
    
    
    @IBAction func LoginPressed(_ sender: Any) {
        
        
    }
    
    

}
