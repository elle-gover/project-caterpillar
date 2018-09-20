//
//  swallowtail.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/17/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation

class Swallowtail: Codable {
    var name: String
    var startDate: String
    var stageOfLife: LifeStage
    
    init(name: String, startDate: String, stageOfLife: LifeStage) {
        self.name = name
        self.startDate = startDate
        self.stageOfLife = stageOfLife
    }
    
    func updateStageOfLife(newLifeStage: LifeStage) {
        self.stageOfLife = newLifeStage
    }
}
