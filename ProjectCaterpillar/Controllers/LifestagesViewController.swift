//
//  LifestagesViewController.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class LifestagesViewController: UITableViewController {
    
    var lifestageCollection: [LifeStage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateLifestageCollection()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: Table Methods

extension LifestagesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifestageCollection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LifestageCell", for: indexPath) as! LifestageCell
        
        cell.setDetails(lifestage: lifestageCollection[indexPath.row])
        
        return cell
    }
    
}

// MARK: Private methods

extension LifestagesViewController {
    
    private func populateLifestageCollection() {
        let lifestagesDatabase = LifestagesDatabase()
        for stage in lifestagesDatabase.lifestages {
            lifestageCollection.append(stage)
        }
    }
    
    
    
}

