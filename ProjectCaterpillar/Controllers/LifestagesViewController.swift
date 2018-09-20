//
//  LifestagesViewController.swift
//  ProjectCaterpillar
//
//  Created by Jordan on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class LifestagesViewController: UITableViewController {
    
    // MARK: Properties
    
    var lifestageCollection: [LifeStage] = []
    var selectedRow = 0
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateLifestageCollection()
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowLifestageDetails" {
            let lifestagesDetailViewController = segue.destination as! LifestagesDetailViewController
            lifestagesDetailViewController.lifestage = lifestageCollection[selectedRow]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: Table methods

extension LifestagesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifestageCollection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LifestageCell", for: indexPath) as! LifestageCell
        cell.setDetails(lifestage: lifestageCollection[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedRow = indexPath.row
        return indexPath
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

