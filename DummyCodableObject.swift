//
//  DummyCodableObject.swift
//  Pref
//
//  Created by Lena Brusilovski on 22/10/2018.
//  Copyright © 2018 Lena Brusilovski. All rights reserved.
//

import UIKit

class DummyCodableObject: NSObject, Codable {

    var name:String!
    var lastName:String!
    
    enum CodingKeys: String, CodingKey {
        case name
        case lastName = "last_name"
    }
}
