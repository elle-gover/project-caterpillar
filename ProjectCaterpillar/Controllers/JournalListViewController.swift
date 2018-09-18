//
//  JournalListViewController.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class JournalListViewController: UITableViewController {
    
    // MARK: - Temporary Data
    var journalEntries: [JournalEntry] = []
    
    var entry1 = JournalEntry(title: "Example Entry", stageOfLife: egg, details: "Found this egg and it's sweet", date: "Sep 18 2018")
    var entry2 = JournalEntry(title: "Another Entry", stageOfLife: caterpillar, details: "Aww it hatched", date: "Sep 20 2018")
    
    func populateEntryArray() {
        journalEntries.append(entry1)
        journalEntries.append(entry2)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        populateEntryArray()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalList", for: indexPath)
        cell.textLabel?.text = "\(journalEntries[indexPath.row].title), \(journalEntries[indexPath.row].date) "
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
