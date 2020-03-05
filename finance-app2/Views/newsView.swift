//
//  newsView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/16/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//


import SwiftUI
import UIKit
//import YoutubePlayer_in_WKWebView
//
struct newsView: View {
    var body: some View {
        let session = URLSession.shared
        let apiKey = "AIzaSyBeZbTWsZ2TKcZ2GlHa7U8UdJtai33L0Kk"
        let query = "rappers"
        let url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=\(query)&key=\(apiKey)")!
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
        // Check the response
//                print(error)
//                print(response)
//            print(JSONDecoder().decode(Decodable.Protocol, from: data!)
            //let finalInfo = try! JSONDecoder().decode(finalInfo, from: data)
//            let stringyData = String(data: data!,encoding:.utf8)

            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:AnyObject]
                print(json)
//                let jsonItems = json["items"] as! [Int: String]
//                let jsonArr = jsonItems[0] as! [String:String]
//                let jsonID = jsonItems["id"] as! [String:String]
//                let jsonVideoId = jsonID["videoId"] as! [String:String]
//                print(jsonVideoId)
//                print(json!["items"]![0]!["id"]!["videoId"]!)
//                print(json["items"][0]["id"]["videoId"])
            }catch let jsonErr{
                print(jsonErr)
            }
            
        })
        task.resume()
        
//        VStack{
        return Text("Hello, World!")
//            YoutubeEmbed(color: UIColor.red)
//        }
    }
}

struct newsView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}

