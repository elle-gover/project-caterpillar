//
//  JournalEntry.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/17/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import Foundation

struct JournalEntry {
    var title: String
    var stageOfLife: LifeStage
    var details: String
    var date: Date // could be string if this data type proves hard to work with
}
