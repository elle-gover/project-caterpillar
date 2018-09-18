//
//  LifeStage.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/17/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation

class LifeStage: NSObject, Codable {
    var name: String
    var food: String
    var stageDescription: String
    var imgFile: String // this could be an image object
    var bulletPoints: [String]
}


