//
//  JournalListViewController.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

class JournalListViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet var entryListView: UITableView!
    
    // MARK: - Properties
    var journalEntries: [JournalEntry] = []
    var selectedEntryIndex = 0
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        populateEntryArray()
        load()
        useLargeTitles()
    }
}

// MARK: - Private Implementation
extension JournalListViewController {
    func populateEntryArray() {
        if checkForLoadFile() {
            load()
        }
        else {
            let sampleEntry = createSampleEntry()
            journalEntries.append(sampleEntry)
        }
    }
    
    func createSampleEntry() -> JournalEntry {
        return JournalEntry(title: "Welcome to your first journal!", stageOfLife: LifestagesDatabase().lifestages[3], details: "Edit or delete this entry to get started.", date: formattedDate())
    }
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        journalEntries.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let today = Date()
        let todayString = dateFormatter.string(from: today)
        let formattedToday = dateFormatter.date(from: todayString)
        
        return dateFormatter.string(from: formattedToday!)
    }
}

// MARK: - Table view data source
extension JournalListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalList", for: indexPath) as! JournalCell
        cell.setJournalCellContent(journalEntry: journalEntries[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedEntryIndex = indexPath.row
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            swipeToDelete(indexPath: indexPath)
            save(entries: journalEntries)
        }
    }
}

// MARK: - Navigation
extension JournalListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JournalToAddEntry" {
            guard let add = segue.destination as? JournalAddEntryViewController else { return }
            add.delegate = self
        }
        else if segue.identifier == "JournalListToDetail" {
            guard let detail = segue.destination as? JournalDetailViewController else { return }
            detail.entryToShow = journalEntries[selectedEntryIndex]
            detail.delegate = self
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
        
        save(entries: journalEntries)
    }
}

// MARK: - JournalDetailViewControllerDelegate Protocol
extension JournalListViewController: JournalDetailViewControllerDelegate {
    func detailVC(_ controller: JournalDetailViewController, didFinishEditing item: JournalEntry) {
        guard let index = self.journalEntries.index(of: item) else { return }
        let indexPath = IndexPath(row: index, section: 0)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JournalList", for: indexPath) as? JournalCell else { return }
        cell.setJournalCellContent(journalEntry: journalEntries[indexPath.row])
        entryListView.reloadData()
        
        navigationController?.popViewController(animated: true)
        
        save(entries: journalEntries)
    }
}

// MARK: - Data Persistence
extension JournalListViewController {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("JournalEntries.plist")
    }
    
    func save(entries: [JournalEntry]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(entries)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error saving data")
        }
    }
    
    func load() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
               journalEntries = try decoder.decode([JournalEntry].self, from: data)
            } catch {
                print("Error decoding object")
            }
        }
    }
    
    func checkForLoadFile() -> Bool {
        let fileManager = FileManager()
        let filePath = dataFilePath().path
        
        return fileManager.fileExists(atPath: filePath)
    }
}
