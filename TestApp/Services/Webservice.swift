//
//  Webservice.swift
//  TestApp
//
//  Created by Abhishek Gupta on 27/08/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation


struct Constant {
    static let BASEURL = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-07-27&sortBy=publishedAt&apiKey=2d58005f9ab546dd945d1ca949e0af79"
    static let apikey = "2d58005f9ab546dd945d1ca949e0af79"
}

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Articles]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                do{
                    
                    let articleList = try JSONDecoder().decode(DataModel.self, from: data)
                    
//                    if let articleList = articleList {
//                        completion(articleList.articles)
//                    }
                    
                    //print(articleList.articles)
                    completion(articleList.articles)
                }catch let jsonError{
                    print(jsonError)
                }
               
                
            }
            
            }.resume()
        
    }
    
}
