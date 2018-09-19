//
//  LifestagesDetailViewController.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/19/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class LifestagesDetailViewController: UIViewController {
    // MARK: Outlets
    
    @IBOutlet weak var lifestageDetailImage: UIImageView!
    @IBOutlet weak var lifestageTitleLabel: UILabel!
    @IBOutlet weak var lifestageDescriptionLabel: UILabel!
    @IBOutlet weak var foodDetailsLabel: UILabel!
    @IBOutlet weak var bulletPointOneFact: UILabel!
    @IBOutlet weak var bulletPointTwoFact: UILabel!
    
    // MARK: Properties
    
    var lifestage: LifeStage?
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = false
        setLifestageDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


// MARK: Private methods

extension LifestagesDetailViewController {
    
    private func setLifestageDetails() {
        guard let lifestage = lifestage else { return }
        lifestageDetailImage.image = UIImage(named: lifestage.imgFile)
        lifestageTitleLabel.text = lifestage.name
        lifestageDescriptionLabel.text = lifestage.stageDescription
        foodDetailsLabel.text = lifestage.food
        bulletPointOneFact.text = lifestage.bulletPoints[0]
        bulletPointTwoFact.text = lifestage.bulletPoints[1]
    }
}
