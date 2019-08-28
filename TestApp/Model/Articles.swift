//
//  DataModel.swift
//  TestApp
//
//  Created by Abhishek Gupta on 22/08/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation
struct Articles : Codable {
	let source: Source
	let title: String
	let description: String
	let urlToImage: String?
	let publishedAt: String

    init(source: Source, title: String, description: String, urlToImage: String?, publishedAt: String){
        self.source = source
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}
