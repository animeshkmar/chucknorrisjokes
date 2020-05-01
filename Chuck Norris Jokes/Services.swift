//
//  Services.swift
//  Chuck Norris Jokes
//
//  Created by Animesh Kumar on 14/04/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class Services {
    
    // FETCH CATEGORIES
    func fetchCategories() -> [String] {
        var categoriesArray: [String]?
        categoriesArray = self.getRequest(requestURL: "https://api.chucknorris.io/jokes/categories") as? [String]
        return categoriesArray ?? ["Something Went Wrong"]
    }
    
    // FETCH JOKE IN CATEGORY
    func fetchJokeInCategory(category: String) -> String {
        let returnValue: [String : Any]?
        let joke: String?
        let url: String  = "https://api.chucknorris.io/jokes/random?category=\(category)"
        returnValue = self.getRequest(requestURL: url) as? [String : Any]
        joke = returnValue?["value"] as? String
        return joke ?? "Something Went Wrong!"
    }
    
}


extension Services {
    
    // GET REQUEST
    func getRequest(requestURL: String) -> Any {
        var fetchComplete: Bool         = false
        var returnValue: Any?
        
        guard let url = URL(string: requestURL) else { return [""] }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    returnValue = json
                }
                catch {
                    print (error)
                }
            }
            fetchComplete = true
        }
        session.resume()
        
        while !fetchComplete {}
        
        return returnValue as Any
    }
    
}
