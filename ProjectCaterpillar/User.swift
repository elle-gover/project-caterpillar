//
//  User.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/17/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation

class User: NSObject, Codable {
    var name: String
    var pet: Swallowtail
    
    init(name: String, pet: Swallowtail) {
        self.name = name
        self.pet = pet
    }
}
