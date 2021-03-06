//
//  JournalAddEntryViewController.swift
//  ProjectCaterpillar
//
//  Created by DetroitLabs on 9/18/18.
//  Copyright © 2018 com.detroitlabs. All rights reserved.
//

import UIKit

protocol JournalAddEntryViewControllerDelegate: class {
    func addDidCancel(_ controller: JournalAddEntryViewController)
    func add(_ controller: JournalAddEntryViewController, didFinishAdding item: JournalEntry)
}

class JournalAddEntryViewController: UITableViewController {
    
    // MARK: - Properties
    weak var delegate: JournalAddEntryViewControllerDelegate?
    var newEntry: JournalEntry?
    let lifeStagesDatabase = LifestagesDatabase()
    var lifeStages: [LifeStage] = []
    
    // MARK: - Outlets
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var lifestagePicker: UIPickerView!
    @IBOutlet weak var detailsView: UITextView!

    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        populateLifeStage()
        lifestagePicker.dataSource = self
        lifestagePicker.delegate = self
        
        detailsView.text = "Write your entry here..."
        detailsView.textColor = UIColor.lightGray
        
        titleField.becomeFirstResponder()
    }

    @IBAction func save() {
        let entry = createNewEntry()
        delegate?.add(self, didFinishAdding: entry)
    }
    
    @IBAction func cancel() {
        delegate?.addDidCancel(self)
    }
    
    func createNewEntry() -> JournalEntry {
        newEntry = JournalEntry(title: titleField.text!, stageOfLife: lifeStages[lifestagePicker.selectedRow(inComponent: 0)], details: detailsView.text!, date: dateField.text!)
        return newEntry!
    }
    
    func populateLifeStage() {
        for stage in lifeStagesDatabase.lifestages {
            lifeStages.append(stage)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Extensions
extension JournalAddEntryViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lifeStages[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lifeStages.count
    }
}

extension JournalAddEntryViewController: UITextViewDelegate {
   
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        if detailsView.textColor == UIColor.lightGray {
            detailsView.text = ""
            detailsView.textColor = UIColor.black
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if detailsView.text.isEmpty {
            detailsView.text = "Write your entry here..."
            detailsView.textColor = UIColor.lightGray
        }
    }
}
