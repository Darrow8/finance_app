//
//  LoginViewController.swift
//  finance-app2
//
//  Created by Darrow Hartman on 1/1/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import FirebaseAuth


class LoginViewController: UIViewController {
    


    @IBOutlet weak var usernameOutlet: UITextField!
    

    @IBOutlet weak var passwordOutlet: UITextField!
    

    @IBAction func loginPressed(_ sender: Any) {
//        apiAccessModule.cryptoSearcher()
        
    }
    
    
    @IBAction func SnapchatPressed(_ sender: Any) {
//        print(apiAccessModule().cryptoSearcher(crypto: "BTC", type: 0))
        print(apiAccessModule().stockSearcher(stock: "TSLA", type: "0.5"))
    }
    
    
    @IBAction func SignupPressed(_ sender: Any) {
        let vc = SignupViewController()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
}
