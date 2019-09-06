//
//  Webservice.swift
//  TestApp
//
//  Created by Abhishek Gupta on 27/08/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation


struct Constant {
    static var date: String = ""
    static let apikey = "2d58005f9ab546dd945d1ca949e0af79"
    static let BASEURL = "https://newsapi.org/v2/everything?q=bitcoin&from=\(date)&sortBy=publishedAt&apiKey=\(apikey)"
    static let fontBold = "RobotoSlab-Bold"
    static let fontRegular = "RobotoSlab-Regular"
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
                    completion(articleList.articles)
                }catch let jsonError{
                    print(jsonError)
                }
            }
            
            }.resume()
    }
}


extension Date {
    
    func getDateForNews() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        let dateStringafd = formatter.string(from: yourDate!)
        //print(dateStringafd)
        return dateStringafd
    }
}

protocol CancelableTask {
    func cancelTask()
}

extension URLSessionDataTask: CancelableTask {
    func cancelTask() {
        self.cancel()
    }
}
