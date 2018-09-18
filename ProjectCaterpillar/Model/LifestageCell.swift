//
//  LifestageCell.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class LifestageCell: UITableViewCell {

    @IBOutlet weak var lifestageImage: UIImageView!
    @IBOutlet weak var lifestageLabel: UILabel!
    func setDetails(lifestage: LifeStage) {
        lifestageLabel.text = lifestage.name
        lifestageImage.image = UIImage(named: lifestage.imgFile)
        
    }
    
}
