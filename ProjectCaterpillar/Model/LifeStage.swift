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
    
    init(name: String, food: String, stageDescription: String, imgFile: String, bulletPoints: [String]) {
        self.name = name
        self.food = food
        self.stageDescription = stageDescription
        self.imgFile = imgFile
        self.bulletPoints = bulletPoints
    }
}

// Our LifeStages:

let egg = LifeStage(name: "egg", food: "none yet", stageDescription: "This is an egg", imgFile: "egg.jpg", bulletPoints: ["This sure is an egg", "Yep it is"])
let caterpillar = LifeStage(name: "caterpillar", food: "dill", stageDescription: "A caterpillar!", imgFile: "caterpillar.jpg", bulletPoints: ["Kinda cute but kinda gross", "Eats so much"])
let butterfly = LifeStage(name: "butterfly", food: "nectar?", stageDescription: "Has wings now", imgFile: "butterfly.jpg", bulletPoints: ["So pretty", "But still a bug"])
