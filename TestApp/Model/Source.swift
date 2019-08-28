//
//  DataModel.swift
//  TestApp
//
//  Created by Abhishek Gupta on 22/08/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation

struct Source : Codable {
	let name: String

    init(name: String){
        self.name = name
    }
}
