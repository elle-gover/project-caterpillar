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
    
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateEntryArray()
        useLargeTitles()
    }
    
    func populateEntryArray() {
        journalEntries.append(entry1)
        journalEntries.append(entry2)
    }
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        journalEntries.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            swipeToDelete(indexPath: indexPath)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JournalToAddEntry" {
            guard let add = segue.destination as? JournalAddEntryViewController else { return }
            add.delegate = self
        }
    }

}

// MARK: - JournalAddEntryViewControllerDelegate Protocol
extension JournalListViewController: JournalAddEntryViewControllerDelegate {
    func addDidCancel(_ controller: JournalAddEntryViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func add(_ controller: JournalAddEntryViewController, didFinishAdding item: JournalEntry) {
        let newRowIndex = journalEntries.count
        journalEntries.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
}
