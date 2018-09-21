//
//  JournalCell.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/20/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class JournalCell: UITableViewCell {
    // MARK: Outlets
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: Public methods
    
    func setJournalCellContent(journalEntry: JournalEntry) {
        icon.image = UIImage(named: journalEntry.stageOfLife.iconFile)
        label.text = journalEntry.title
    }
}
