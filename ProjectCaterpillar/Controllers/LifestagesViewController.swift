//
//  LifestagesViewController.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class LifestagesViewController: UITableViewController {
    
    var lifestageObjects: [LifeStage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lifestageOne = LifeStage(name: "Egg", food: "Dill", stageDescription: "Eat eat eat", imgFile: "lifestage1", bulletPoints: ["This is so cool!", "I can't wait to be a butterfly"])
        
        lifestageObjects.append(lifestageOne)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: Table Methods

extension LifestagesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LifestageCell", for: indexPath) as! LifestageCell
        
        cell.setDetails(lifestage: lifestageObjects[0])
        
        return cell
    }
    
}
