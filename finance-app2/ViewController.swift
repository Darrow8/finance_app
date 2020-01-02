//
//  ViewController.swift
//  finance-app2
//
//  Created by Darrow Hartman on 12/31/19.
//  Copyright © 2019 Darrow Hartman. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class ViewController: UIViewController {
    let headers = [
        "x-rapidapi-host": "alpha-vantage.p.rapidapi.com",
        "x-rapidapi-key": "22ea4d601bmsh400707d28d1dd3fp12a0fdjsnbe0adaf44778"
    ]
    let cryptoTypes = [
       "1. From_Currency Code",
       "2. From_Currency Name",
       "3. To_Currency Code",
       "4. To_Currency Name",
       "5. Exchange Rate",
       "6. Last Refreshed",
       "7. Time Zone",
       "8. Bid Price",
       "9. Ask Price"
    ]
    let stockTypes = [
    "01. symbol",
    "02. open",
    "03. high",
    "04. low",
    "05. price",
    "06. volume",
    "07. latest trading day",
    "08. previous close",
    "09. change",
    "10. change percent"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        cryptoSearcher(crypto: "BTC", type: cryptoTypes[4])
//        stockSearcher(stock: "APPL", type: "05. price")
    }
    
    
    func cryptoSearcher(crypto: String, type: String){
        let url = "https://alpha-vantage.p.rapidapi.com/query?from_currency=\(crypto)&function=CURRENCY_EXCHANGE_RATE&to_currency=USD"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                        cachePolicy: .useProtocolCachePolicy,
                                                    timeoutInterval: 10.0)
                request.httpMethod = "GET"
                request.allHTTPHeaderFields = headers

                let session = URLSession.shared
                let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                    if (error != nil) {
                        print(error)
                    } else {
                        let httpResponse = response as? HTTPURLResponse

                        let json = try? JSON(data: data!)
                        let cryptoFinder = json!["Realtime Currency Exchange Rate"][type].stringValue
                    print("Here is your data: " + cryptoFinder)
                    }
                })

                dataTask.resume()
    }
    
    
    
    func stockSearcher(stock: String, type: String){
        let url = "https://alpha-vantage.p.rapidapi.com/query?datatype=json&function=GLOBAL_QUOTE&symbol=TSLA"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
                    let json = try? JSON(data: data!)
                    let stockFinder = json!["Global Quote"]["05. price"].stringValue
                print("Here is your data: " + stockFinder)
            }
        })

        dataTask.resume()
    }
    
}
