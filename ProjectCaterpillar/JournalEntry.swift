//
//  JournalEntry.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/17/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation

class JournalEntry: NSObject, Codable {
    var title: String
    var stageOfLife: LifeStage
    var details: String
    var date: String // could be Date object
    
    init(title: String, stageOfLife: LifeStage, details: String, date: String) {
        self.title = title
        self.stageOfLife = stageOfLife
        self.details = details
        self.date = date
    }
}
