//
//  YoutubeView.swift
//  finance-app2
//
//  Created by Darrow Hartman on 2/29/20.
//  Copyright © 2020 Darrow Hartman. All rights reserved.
//

import SwiftUI
import UIKit
import YoutubePlayer_in_WKWebView

struct YoutubeView: UIViewRepresentable {
//    @Binding var text: String

    func makeUIView(context: Context) -> WKYTPlayerView {
        return WKYTPlayerView()
    }

    func updateUIView(_ uiView: WKYTPlayerView, context: Context) {
//        uiView.text = text
//        uiView.
    }
    
//
//    func youtubeData(){
//
//                let session = URLSession.shared
//                let apiKey = "AIzaSyCKF0Ii5lBu2JID3lQTRtsGUb3JV6gACqc"
//                let query = "rappers"
//                let url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=\(query)&key=\(apiKey)")!
//                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
//                // Check the response
//        //                print(error)
//        //                print(response)
//        //            print(JSONDecoder().decode(Decodable.Protocol, from: data!)
//                    //let finalInfo = try! JSONDecoder().decode(finalInfo, from: data)
//        //            let stringyData = String(data: data!,encoding:.utf8)
//
//                    do{
//                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:AnyObject]
//                        print(json)
//        //                let jsonItems = json["items"] as! [Int: String]
//        //                let jsonArr = jsonItems[0] as! [String:String]
//        //                let jsonID = jsonItems["id"] as! [String:String]
//        //                let jsonVideoId = jsonID["videoId"] as! [String:String]
//        //                print(jsonVideoId)
//        //                print(json!["items"]![0]!["id"]!["videoId"]!)
//        //                print(json["items"][0]["id"]["videoId"])
//                    }catch let jsonErr{
//                        print(jsonErr)
//                    }
//
//                })
//                task.resume()
//    }
}
