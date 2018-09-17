//
//  swallowtail.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/17/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation

class Swallowtail {
    var name: String
    var startDate: String
    var imgFileName: String // using string instead of img so we can save to .plist
    var stageOfLife: LifeStage
    
    init(name: String, startDate: String, imgFileName: String, stageOfLife: LifeStage) {
        self.name = name
        self.startDate = startDate
        self.imgFileName = imgFileName
        self.stageOfLife = stageOfLife
    }
    
    func updateStageOfLife(newLifeStage: LifeStage) {
        self.stageOfLife = newLifeStage
    }
}
