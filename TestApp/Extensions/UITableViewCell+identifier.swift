//
//  UITableViewCell+identifier.swift
//  TestApp
//
//  Created by Abhishek Gupta on 27/08/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var identifier:String{
        return String(describing: self)
    }
}
