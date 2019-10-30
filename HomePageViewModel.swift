//
//  HomePageViewModel.swift
//  SampleTest
//
//  Created by Spandana Nayakanti on 6/21/19.
//  Copyright © 2019 Spandana. All rights reserved.
//

import UIKit

class HomePageViewModel: NSObject {
    typealias CompletionHandler = (_ users:[HomePageModel.User]) -> Void
    //Api call
    func getUserData(completionBlock:@escaping CompletionHandler)  {
        
        var request = URLRequest(url: URL(string: "https://api.myjson.com/bins/e503u")! as URL)
        request.httpMethod = "GET"
        let dataSession = URLSession.shared
    
        let dataTask = dataSession.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                // Received the successful data
                do{
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Dictionary<String,Any>] {
                        print(jsonArray)
                        let finalUserData = HomePageModel.User.getUserDataWith(array: jsonArray)
                        completionBlock(finalUserData)
                    } else {
                        print("Json is wrong")
                    }
                }catch let error as NSError {
                    print(error)
                }
            }
        })
        dataTask.resume()
    }
    
}

