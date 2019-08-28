//
//  DataModel.swift
//  TestApp
//
//  Created by Abhishek Gupta on 22/08/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation

struct DataModel : Codable {
    let status: String
    let totalResults: Int
    let articles: [Articles]
    
    init(status: String, totalResults: Int, articles: [Articles]){
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}
